Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C6ACF09CD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 06:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eN1f7wtLY99ZwqhMUD41aV/lmTDug1CT/tZhADMnTA=; b=ie7gX/fTgSUF35O1AibHV0khWd
	DVqAoU5nJ44kXscj81w2EfkfBcXEiSg/wiW1ipTWSPIFQwWnTO50S8wZjXndZeThzjACmWIkshDoZ
	7eV5V8aRPnqnJksPGv8qZis9Z4ovQ5bGkKhhWnn1WWPrJ3iQHVqMx2CvGNsRpIJpfo5E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcGf3-0000FS-UU;
	Sun, 04 Jan 2026 05:28:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vcGf2-0000FM-R8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 05:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iq2VhjiuHWNEXWploQCJe0/QbzPer0GdYMe85FOvaQM=; b=Yig5OdrIOM9xSXdGGCzS6vDxep
 pvfYdHnlOcQBO1hYvb7iTk7DU+YIWej9dLXXD6UB9yaqdtYDXYzf9sT7JDpvU0CuDdI80hMVnVHJI
 7CxA6TCg2p0VwF9+rOBZKGcxzLD2VjG0sQdxz4DCnjuvk73HQIdPAWIzVvy/NrDvYS7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iq2VhjiuHWNEXWploQCJe0/QbzPer0GdYMe85FOvaQM=; b=MxjFBPQN97+KWGao8tz5XJg+Uv
 lvHMv3GR0XGDELAqyyqQd/srcIq7N7OKENSEe/uLeSIE4ohGU8aUGKwmAXdZ/UGcFiKRzgqjsupy1
 LS/Aa7LvIaXzTB5BiyMfkE+ik0kkrroSSYtUz8l+pvhWqpncHAmHIk5I2YXgrHet8140=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcGf2-0002SU-18 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 05:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D0F840E1E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 05:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C636C4CEF7;
 Sun,  4 Jan 2026 05:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767504485;
 bh=NYubMIl7QY43/Rl2YlmZaJkJua99p9MiM6UqUDnfHvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mev1wHtZOCj/EEfKOhkiRAaiiZH9jvcErdvYeTKGe8HVUGxxfXnUfbBtvrp4Jn+mT
 DSX/OY4yO785bG+yytYRxpw9z3ZRibPIuxYShjslWs9kYAao729Y3KdnSyEV/hCZK2
 EOlO0VI0xIz6HzXMR2nmI+Ae15nWHGZw2/aejNeoNPf0PGXfNXMn79LfY4XCYcDPAY
 Ge82Dr4bHv9+aMOBNR1jPxOmiKWk69iUejiuw19czdFzpg7Gs1ltNo+EALjspVY9Cb
 698QbnR9UI388jU2GrgxK6X4NPkyhmOkgjHuDaXjC27JthF5Sc/YVHOHEDFkWScWCQ
 z2BoA0QzYvKKw==
Date: Sun, 4 Jan 2026 05:28:03 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aVn6YymF08qGPJ3P@google.com>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Stuck when disabling checkpoint: [ 403.438233][ T739]
 __switch_to+0x164/0x324
 [ 403.442532][ T739] __schedule+0xbd0/0x1d28 [ 403.446822][ T739]
 schedule+0x4c/0x118
 [ 403.450758][ T739] schedule_preempt_disabled+0x24/0x44 [ 403.456083 [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcGf2-0002SU-18
Subject: Re: [f2fs-dev] [PATCH 01/14] f2fs: add lock elapsed time trace
 facility for f2fs rwsemphore
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Stuck when disabling checkpoint:

[  403.438233][  T739]  __switch_to+0x164/0x324
[  403.442532][  T739]  __schedule+0xbd0/0x1d28
[  403.446822][  T739]  schedule+0x4c/0x118
[  403.450758][  T739]  schedule_preempt_disabled+0x24/0x44
[  403.456083][  T739]  rwsem_down_write_slowpath+0x438/0x988
[  403.461588][  T739]  down_write+0x10c/0x16c
[  403.465785][  T739]  f2fs_down_write_trace+0x1c/0x70
[  403.470797][  T739]  f2fs_disable_checkpoint+0x114/0x2b8
[  403.476126][  T739]  f2fs_fill_super+0x22c8/0x2728
[  403.480924][  T739]  get_tree_bdev_flags+0x144/0x1dc
[  403.485894][  T739]  get_tree_bdev+0x14/0x24
[  403.490176][  T739]  f2fs_get_tree+0x18/0x28
[  403.494448][  T739]  vfs_get_tree+0x48/0x10c
[  403.498724][  T739]  path_mount+0x62c/0xb74

On 01/04, Chao Yu wrote:
> This patch adds lock elapsed time trace facility for f2fs rwsemphore.
> 
> If total elapsed time of critical region covered by lock exceeds a
> threshold, it will print tracepoint to dump information of lock related
> context, including:
> - thread information
> - CPU/IO priority
> - lock information
> - elapsed time
>  - total time
>  - running time (depend on CONFIG_64BIT)
>  - runnable time (depend on CONFIG_SCHED_INFO and CONFIG_SCHEDSTATS)
>  - io sleep time (depend on CONFIG_TASK_DELAY_ACCT and
> 		  /proc/sys/kernel/task_delayacct)
>  - other time    (by default other time will account nonio sleep time,
>                   but, if above kconfig is not defined, other time will
>                   include runnable time and/or io sleep time as wll)
> 
> output:
>     f2fs_lock_elapsed_time: dev = (254,52), comm: sh, pid: 13855, prio: 120, ioprio_class: 2, ioprio_data: 4, lock_name: cp_rwsem, lock_type: rlock, total: 1000, running: 993, runnable: 2, io_sleep: 0, other: 5
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c        | 106 ++++++++++++++++++++++++++++++++++++
>  fs/f2fs/f2fs.h              |  51 +++++++++++++++--
>  include/trace/events/f2fs.h |  68 +++++++++++++++++++++++
>  3 files changed, 221 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 300664269eb6..bc6058a3122b 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -14,6 +14,9 @@
>  #include <linux/pagevec.h>
>  #include <linux/swap.h>
>  #include <linux/kthread.h>
> +#include <linux/delayacct.h>
> +#include <linux/ioprio.h>
> +#include <linux/math64.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -21,6 +24,109 @@
>  #include "iostat.h"
>  #include <trace/events/f2fs.h>
>  
> +static inline void get_lock_elapsed_time(struct f2fs_time_stat *ts)
> +{
> +	ts->total_time = ktime_get();
> +#ifdef CONFIG_64BIT
> +	ts->running_time = current->se.sum_exec_runtime;
> +#endif
> +#if defined(CONFIG_SCHED_INFO) && defined(CONFIG_SCHEDSTATS)
> +	ts->runnable_time = current->sched_info.run_delay;
> +#endif
> +#ifdef CONFIG_TASK_DELAY_ACCT
> +	if (current->delays)
> +		ts->io_sleep_time = current->delays->blkio_delay;
> +#endif
> +}
> +
> +static inline void trace_lock_elapsed_time_start(struct f2fs_rwsem *sem,
> +						struct f2fs_lock_context *lc)
> +{
> +	lc->lock_trace = trace_f2fs_lock_elapsed_time_enabled();
> +	if (!lc->lock_trace)
> +		return;
> +
> +	get_lock_elapsed_time(&lc->ts);
> +}
> +
> +static inline void trace_lock_elapsed_time_end(struct f2fs_rwsem *sem,
> +				struct f2fs_lock_context *lc, bool is_write)
> +{
> +	struct f2fs_time_stat tts;
> +	unsigned long long total_time;
> +	unsigned long long running_time = 0;
> +	unsigned long long runnable_time = 0;
> +	unsigned long long io_sleep_time = 0;
> +	unsigned long long other_time = 0;
> +	unsigned npm = NSEC_PER_MSEC;
> +
> +	if (!lc->lock_trace)
> +		return;
> +
> +	get_lock_elapsed_time(&tts);
> +
> +	total_time = div_u64(tts.total_time - lc->ts.total_time, npm);
> +	if (total_time <= MAX_LOCK_ELAPSED_TIME)
> +		return;
> +
> +#ifdef CONFIG_64BIT
> +	running_time = div_u64(tts.running_time - lc->ts.running_time, npm);
> +#endif
> +#if defined(CONFIG_SCHED_INFO) && defined(CONFIG_SCHEDSTATS)
> +	runnable_time = div_u64(tts.runnable_time - lc->ts.runnable_time, npm);
> +#endif
> +#ifdef CONFIG_TASK_DELAY_ACCT
> +	io_sleep_time = div_u64(tts.io_sleep_time - lc->ts.io_sleep_time, npm);
> +#endif
> +	if (total_time > running_time + io_sleep_time + runnable_time)
> +		other_time = total_time - running_time -
> +				io_sleep_time - runnable_time;
> +
> +	trace_f2fs_lock_elapsed_time(sem->sbi, sem->name, is_write, current,
> +			get_current_ioprio(), total_time, running_time,
> +			runnable_time, io_sleep_time, other_time);
> +}
> +
> +void f2fs_down_read_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc)
> +{
> +	f2fs_down_read(sem);
> +	trace_lock_elapsed_time_start(sem, lc);
> +}
> +
> +int f2fs_down_read_trylock_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc)
> +{
> +	if (!f2fs_down_read_trylock(sem))
> +		return 0;
> +	trace_lock_elapsed_time_start(sem, lc);
> +	return 1;
> +}
> +
> +void f2fs_up_read_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc)
> +{
> +	f2fs_up_read(sem);
> +	trace_lock_elapsed_time_end(sem, lc, false);
> +}
> +
> +void f2fs_down_write_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc)
> +{
> +	f2fs_down_write(sem);
> +	trace_lock_elapsed_time_start(sem, lc);
> +}
> +
> +int f2fs_down_write_trylock_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc)
> +{
> +	if (!f2fs_down_write_trylock(sem))
> +		return 0;
> +	trace_lock_elapsed_time_start(sem, lc);
> +	return 1;
> +}
> +
> +void f2fs_up_write_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc)
> +{
> +	f2fs_up_write(sem);
> +	trace_lock_elapsed_time_end(sem, lc, true);
> +}
> +
>  #define DEFAULT_CHECKPOINT_IOPRIO (IOPRIO_PRIO_VALUE(IOPRIO_CLASS_RT, 3))
>  
>  static struct kmem_cache *ino_entry_slab;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c3e1611fce18..7e22315dbedd 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -173,6 +173,10 @@ enum device_allocation_policy {
>  	ALLOCATE_FORWARD_FROM_HINT,
>  };
>  
> +enum f2fs_lock_name {
> +	LOCK_NAME_NONE,
> +};
> +
>  /*
>   * An implementation of an rwsem that is explicitly unfair to readers. This
>   * prevents priority inversion when a low-priority reader acquires the read lock
> @@ -181,6 +185,8 @@ enum device_allocation_policy {
>   */
>  
>  struct f2fs_rwsem {
> +	struct f2fs_sb_info *sbi;
> +	enum f2fs_lock_name name;
>          struct rw_semaphore internal_rwsem;
>  #ifdef CONFIG_F2FS_UNFAIR_RWSEM
>          wait_queue_head_t read_waiters;
> @@ -1409,6 +1415,24 @@ struct f2fs_gc_control {
>  	unsigned int nr_free_secs;	/* # of free sections to do GC */
>  };
>  
> +struct f2fs_time_stat {
> +	unsigned long long total_time;		/* total wall clock time */
> +#ifdef CONFIG_64BIT
> +	unsigned long long running_time;	/* running time */
> +#endif
> +#if defined(CONFIG_SCHED_INFO) && defined(CONFIG_SCHEDSTATS)
> +	unsigned long long runnable_time;	/* runnable(including preempted) time */
> +#endif
> +#ifdef CONFIG_TASK_DELAY_ACCT
> +	unsigned long long io_sleep_time;	/* IO sleep time */
> +#endif
> +};
> +
> +struct f2fs_lock_context {
> +	struct f2fs_time_stat ts;
> +	bool lock_trace;
> +};
> +
>  /*
>   * For s_flag in struct f2fs_sb_info
>   * Modification on enum should be synchronized with s_flag array
> @@ -1525,6 +1549,9 @@ enum f2fs_lookup_mode {
>  	LOOKUP_AUTO,
>  };
>  
> +/* a threshold of maximum elapsed time in critical region to print tracepoint */
> +#define MAX_LOCK_ELAPSED_TIME		500
> +
>  static inline int f2fs_test_bit(unsigned int nr, char *addr);
>  static inline void f2fs_set_bit(unsigned int nr, char *addr);
>  static inline void f2fs_clear_bit(unsigned int nr, char *addr);
> @@ -2263,16 +2290,22 @@ static inline void clear_ckpt_flags(struct f2fs_sb_info *sbi, unsigned int f)
>  	spin_unlock_irqrestore(&sbi->cp_lock, flags);
>  }
>  
> -#define init_f2fs_rwsem(sem)					\
> +#define init_f2fs_rwsem(sem)	__init_f2fs_rwsem(sem, NULL, LOCK_NAME_NONE)
> +#define init_f2fs_rwsem_trace	__init_f2fs_rwsem
> +
> +#define __init_f2fs_rwsem(sem, sbi, name)			\
>  do {								\
>  	static struct lock_class_key __key;			\
>  								\
> -	__init_f2fs_rwsem((sem), #sem, &__key);			\
> +	do_init_f2fs_rwsem((sem), #sem, &__key, sbi, name);	\
>  } while (0)
>  
> -static inline void __init_f2fs_rwsem(struct f2fs_rwsem *sem,
> -		const char *sem_name, struct lock_class_key *key)
> +static inline void do_init_f2fs_rwsem(struct f2fs_rwsem *sem,
> +		const char *sem_name, struct lock_class_key *key,
> +		struct f2fs_sb_info *sbi, enum f2fs_lock_name name)
>  {
> +	sem->sbi = sbi;
> +	sem->name = name;
>  	__init_rwsem(&sem->internal_rwsem, sem_name, key);
>  #ifdef CONFIG_F2FS_UNFAIR_RWSEM
>  	init_waitqueue_head(&sem->read_waiters);
> @@ -2341,6 +2374,16 @@ static inline void f2fs_up_write(struct f2fs_rwsem *sem)
>  #endif
>  }
>  
> +void f2fs_down_read_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc);
> +int f2fs_down_read_trylock_trace(struct f2fs_rwsem *sem,
> +						struct f2fs_lock_context *lc);
> +void f2fs_up_read_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc);
> +void f2fs_down_write_trace(struct f2fs_rwsem *sem,
> +						struct f2fs_lock_context *lc);
> +int f2fs_down_write_trylock_trace(struct f2fs_rwsem *sem,
> +						struct f2fs_lock_context *lc);
> +void f2fs_up_write_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc);
> +
>  static inline void disable_nat_bits(struct f2fs_sb_info *sbi, bool lock)
>  {
>  	unsigned long flags;
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 635dcabcf1c7..9a852a16df9c 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -184,6 +184,10 @@ TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
>  		{ CP_PHASE_FINISH_BLOCK_OPS,	"finish block_ops" },			\
>  		{ CP_PHASE_FINISH_CHECKPOINT,	"finish checkpoint" })
>  
> +#define show_lock_name(lock)						\
> +	__print_symbolic(lock,						\
> +		{ LOCK_NAME_NONE,		"none" })
> +
>  struct f2fs_sb_info;
>  struct f2fs_io_info;
>  struct extent_info;
> @@ -2452,6 +2456,70 @@ DEFINE_EVENT(f2fs__rw_end, f2fs_datawrite_end,
>  	TP_ARGS(inode, offset, bytes)
>  );
>  
> +TRACE_EVENT(f2fs_lock_elapsed_time,
> +
> +	TP_PROTO(struct f2fs_sb_info *sbi, enum f2fs_lock_name lock_name,
> +		bool is_write, struct task_struct *p, int ioprio,
> +		unsigned long long total_time,
> +		unsigned long long running_time,
> +		unsigned long long runnable_time,
> +		unsigned long long io_sleep_time,
> +		unsigned long long other_time),
> +
> +	TP_ARGS(sbi, lock_name, is_write, p, ioprio, total_time, running_time,
> +		runnable_time, io_sleep_time, other_time),
> +
> +	TP_STRUCT__entry(
> +		__field(dev_t, dev)
> +		__array(char, comm, TASK_COMM_LEN)
> +		__field(pid_t, pid)
> +		__field(int, prio)
> +		__field(int, ioprio_class)
> +		__field(int, ioprio_data)
> +		__field(unsigned int, lock_name)
> +		__field(bool, is_write)
> +		__field(unsigned long long, total_time)
> +		__field(unsigned long long, running_time)
> +		__field(unsigned long long, runnable_time)
> +		__field(unsigned long long, io_sleep_time)
> +		__field(unsigned long long, other_time)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev		= sbi->sb->s_dev;
> +		memcpy(__entry->comm, p->comm, TASK_COMM_LEN);
> +		__entry->pid		= p->pid;
> +		__entry->prio		= p->prio;
> +		__entry->ioprio_class	= IOPRIO_PRIO_CLASS(ioprio);
> +		__entry->ioprio_data	= IOPRIO_PRIO_DATA(ioprio);
> +		__entry->lock_name	= lock_name;
> +		__entry->is_write	= is_write;
> +		__entry->total_time	= total_time;
> +		__entry->running_time	= running_time;
> +		__entry->runnable_time	= runnable_time;
> +		__entry->io_sleep_time	= io_sleep_time;
> +		__entry->other_time	= other_time;
> +	),
> +
> +	TP_printk("dev = (%d,%d), comm: %s, pid: %d, prio: %d, "
> +		"ioprio_class: %d, ioprio_data: %d, lock_name: %s, "
> +		"lock_type: %s, total: %llu, running: %llu, "
> +		"runnable: %llu, io_sleep: %llu, other: %llu",
> +		show_dev(__entry->dev),
> +		__entry->comm,
> +		__entry->pid,
> +		__entry->prio,
> +		__entry->ioprio_class,
> +		__entry->ioprio_data,
> +		show_lock_name(__entry->lock_name),
> +		__entry->is_write ? "wlock" : "rlock",
> +		__entry->total_time,
> +		__entry->running_time,
> +		__entry->runnable_time,
> +		__entry->io_sleep_time,
> +		__entry->other_time)
> +);
> +
>  #endif /* _TRACE_F2FS_H */
>  
>   /* This part must be outside protection */
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
