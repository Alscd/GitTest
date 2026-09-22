import type { Meta, StoryObj } from '@storybook/react'
import { Icon, Ring } from '@factory/ui'

/**
 * FAC-1003 / FAC-998 AC2 proof: these primitives are imported from the
 * packaged `@factory/ui` tarball (see ../../vendor + scripts/fetch-factory-ui.sh),
 * not from source inside a monorepo — this repo has no relationship to
 * Alscd/nutrition-tracker beyond that one dependency.
 */
const meta: Meta = {
  title: 'External proof/@factory/ui',
}
export default meta

type Story = StoryObj

export const IconPrimitive: Story = {
  render: () => (
    <div style={{ display: 'flex', gap: 16, alignItems: 'center', color: '#4434d4' }}>
      <Icon name="star" size="sm" />
      <Icon name="star" size="md" />
      <Icon name="star" size="lg" label="Favorite" />
    </div>
  ),
}

export const RingPrimitive: Story = {
  render: () => (
    <Ring pct={62} size={140} hole={112} color="#4434d4" track="#e5e0fb">
      <span style={{ fontSize: 20, fontWeight: 600 }}>62%</span>
    </Ring>
  ),
}
