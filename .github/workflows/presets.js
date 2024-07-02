import * as process from 'node:process'

const platforms = ['linux/arm64', 'linux/amd64']

const presets = {
  default: {
    suffix: '',
    latest: true,
    args: {},
  },
  manylinux_2_17: {
    suffix: '-manylinux_2_17',
    latest: false,
    args: {
      ZIGBUILD_GLIBC: '2.17',
      DEFAULT_PYTHON_VERSION: '3.10',
      DEFAULT_NODE_VERSION: '16',
      DEFAULT_PNPM_VERSION: '8',
    },
    cross: {
      'linux/arm64': 'quay.io/pypa/manylinux2014_aarch64:latest',
      'linux/amd64': 'quay.io/pypa/manylinux2014_x86_64:latest',
    },
  },
}

const builds = Object.entries(presets).flatMap(
  ([name, { suffix, args, cross, latest }]) =>
    platforms.map((platform) => {
      const env = Object.entries(args)
      if (cross) {
        env.push(['DEVCONTAINER_IMAGE', cross[platform]])
      }
      const buildArgs = env.map(([key, value]) => `${key}=${value}`).join('\n')
      return { name, platform, suffix, latest, 'build-args': buildArgs }
    }),
)

const tags = Object.entries(presets).flatMap(([name, { suffix, latest }]) => ({
  name,
  suffix,
  latest,
}))

process.stdout.write('builds<<EOF\n')
process.stdout.write(JSON.stringify(builds, null, 2))
process.stdout.write('\nEOF\n')

process.stdout.write('tags<<EOF\n')
process.stdout.write(JSON.stringify(tags, null, 2))
process.stdout.write('\nEOF\n')
