Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7DB90E83B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2024 12:21:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJsRc-0005Oq-Fi;
	Wed, 19 Jun 2024 10:21:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sJsRY-0005Oh-O3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 10:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8kJf0vle5tqeHQ7mHeVnyUrEBIr4bh/Zd7Ch7myBOog=; b=WqH4mTz9ElkjrJe81j8l7AzVWt
 yUCnT+ERvrZ8x4+y0wAbQ/+gJwQSqOP6VbAN0JySpzIOdWMRbZ6E+hgbng/oy1NA144cXGY7pv3Wb
 lHKoVQlX03MzG2dwIrqd6QdOYcCz7vuNsfGPwTPBnXORpv4JZfYXveMjLpgP17wdOeBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8kJf0vle5tqeHQ7mHeVnyUrEBIr4bh/Zd7Ch7myBOog=; b=Bekyt8FPTprexufvuSSDjIKoWe
 lGgoFAnw6TL+6tyfVDoWw1xP5W4G9Pu7hysMqx+UZvkQoCyqDtw1BteveMiSBEvgO3v8ddSrCSaHP
 XHF3eMLRWTiMM1poDuo6j5fN1f4NTo1FGSH3uZHJ/XFf4QFw6iUwHbIXzISZci75E054=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJsRY-0000AJ-Dm for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 10:21:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A6014CE1AC8;
 Wed, 19 Jun 2024 10:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FE7C32786;
 Wed, 19 Jun 2024 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718792483;
 bh=P7BVwrlPu5JLfPjoFAsx3EZJBuN98wCr8B57Z2OIK8w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u4l+f3OgZGiRgcrI9V1lttiQ8oOOKmdVmGbM5rAXXz5SlJ182Tsbt/AalMKT0gGCP
 t9N2p6DfZntt3f3WYM5QDpnvKW9F5ZRcyc3qfQrbAhLQFBTZImsu7F+7QzqpLSlKWN
 MHOHSGwPml1OMmgnMDSAGeDbC3AQIwvu0RY/vC9wPPeHJGvkXpOwIzv2wDTUotdrvJ
 vm2+QWd+WvrUugXpTmtbnSIbfkeeKZiKDAghT87udxpfy9smNitz1J+jwvRkFmkEPl
 qS7KGazXyFalD2PsGOg1+xVn2X2gL58hSU3rSB/6+nIDpUbjg6DWin7gIPJfcL0AMS
 x7l8vhsvcArag==
Message-ID: <a4ae575c-9eee-47fe-b49d-c71737022d24@kernel.org>
Date: Wed, 19 Jun 2024 18:21:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20240617045134epcms2p3f2f82336438f636b3f1ad58fd0c1cd29@epcms2p3>
 <20240617045134epcms2p3f2f82336438f636b3f1ad58fd0c1cd29@epcms2p3>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240617045134epcms2p3f2f82336438f636b3f1ad58fd0c1cd29@epcms2p3>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/17 12:51, Daejun Park wrote: > The amount of node
 writes is small compared to the amount of user data > writes in most
 workloads.
 Therefore, even if there is enough free space > in the node [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJsRY-0000AJ-Dm
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add support single node mode
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/17 12:51, Daejun Park wrote:
> The amount of node writes is small compared to the amount of user data
> writes in most workloads. Therefore, even if there is enough free space
> in the node section, it cannot be used by another type because the type
> for its section is fixed. When using zoned storage, the free space in
> node section issue can be a problem due to the large section.
> 
> This patch can avoid the problem by using a single node section without
> considering the hotness of the node section. For particularly high file
> system usage, two sections can be used as free sections, which makes it
> more efficient.
> 
> To use single node section, add the 'single_node_sec' in mount option.
> The single node section mode can be activated when the number of active
> logs is equal to 6.

This patch is out-of-format due to tab is replaced as blanks.

> 
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
>   Documentation/filesystems/f2fs.rst |  2 +
>   fs/f2fs/f2fs.h                     |  3 ++
>   fs/f2fs/recovery.c                 |  3 ++
>   fs/f2fs/segment.c                  | 78 ++++++++++++++++++++++++++++++
>   fs/f2fs/segment.h                  |  2 +
>   fs/f2fs/super.c                    | 12 +++++
>   6 files changed, 100 insertions(+)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 68a0885fb5e6..ba26b2ce4fa4 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -134,6 +134,8 @@ noacl                        Disable POSIX Access Control List. Note: acl is enabled
>   active_logs=%u          Support configuring the number of active logs. In the
>                           current design, f2fs supports only 2, 4, and 6 logs.
>                           Default number is 6.
> +single_node_sec         Support single node section mode, it enables single active
> +                        log for hot/warm/cold nodes. This is disabled by default.

Do we allow changing this config during remount?

>   disable_ext_identify    Disable the extension list configured by mkfs, so f2fs
>                           is not aware of cold files such as media files.
>   inline_xattr            Enable the inline xattrs feature.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 1974b6aff397..90f13a6b64ce 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -116,6 +116,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>   #define        F2FS_MOUNT_GC_MERGE             0x02000000
>   #define F2FS_MOUNT_COMPRESS_CACHE      0x04000000
>   #define F2FS_MOUNT_AGE_EXTENT_CACHE    0x08000000
> +#define F2FS_MOUNT_SINGLE_NODE_SEC     0x10000000
> 
>   #define F2FS_OPTION(sbi)       ((sbi)->mount_opt)
>   #define clear_opt(sbi, option) (F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> @@ -1655,6 +1656,8 @@ struct f2fs_sb_info {
> 
>          struct f2fs_mount_info mount_opt;       /* mount options */
> 
> +       bool single_node_sec;                   /* single node section */

Better to move it into struct f2fs_mount_info?

> +
>          /* for cleaning operations */
>          struct f2fs_rwsem gc_lock;              /*
>                                                   * semaphore for GC, avoid
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 496aee53c38a..b5cdb0845ac7 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -414,6 +414,9 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
> 
>          /* get node pages in the current segment */
>          curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
> +       /* check hot node if single node section mode is enabled */
> +       if (sbi->single_node_sec && curseg->segno == NULL_SEGNO)
> +               curseg = CURSEG_I(sbi, CURSEG_HOT_NODE);

If we turn off single_node_sec mode, fsynced data may be lost since warm node
chain is empty?

>          blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
>          blkaddr_fast = blkaddr;
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a0ce3d080f80..81b4d52b25c0 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -394,6 +394,9 @@ int f2fs_commit_atomic_write(struct inode *inode)
>          return err;
>   }
> 
> +static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec);
> +static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno);
> +
>   /*
>    * This function balances dirty node and dentry pages.
>    * In addition, it controls garbage collection.
> @@ -420,6 +423,59 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>          if (has_enough_free_secs(sbi, 0, 0))
>                  return;
> 
> +       if (test_opt(sbi, SINGLE_NODE_SEC) && !sbi->single_node_sec &&
> +           F2FS_OPTION(sbi).active_logs == 6) {
> +               int type, segno, left_blocks = 0;
> +
> +               for (type = CURSEG_HOT_NODE; type <= CURSEG_COLD_NODE; type++) {
> +                       segno = CURSEG_I(sbi, type)->segno;
> +                       left_blocks += CAP_BLKS_PER_SEC(sbi) -
> +                                       get_ckpt_valid_blocks(sbi, segno, true);
> +               }
> +
> +               /* enable single node section mode if we get 2 free sections */
> +               if (left_blocks < CAP_BLKS_PER_SEC(sbi) * 2)
> +                       goto do_gc;
> +
> +               f2fs_down_read(&SM_I(sbi)->curseg_lock);
> +               down_write(&SIT_I(sbi)->sentry_lock);
> +
> +               /* it can be enabled by others */
> +               if (sbi->single_node_sec)
> +                       goto unlock;
> +
> +               /* leave current zone by allocating new section */
> +               for (type = CURSEG_WARM_NODE; type <= CURSEG_COLD_NODE; type++) {
> +                       struct curseg_info *curseg = CURSEG_I(sbi, type);
> +
> +                       mutex_lock(&curseg->curseg_mutex);
> +                       segno = curseg->segno;
> +                       if (new_curseg(sbi, type, true)) {

It looks dangerous to allocate new section here for the case there
is heavy fragment and no available user space, because free section
may be exhausted during latter FGGC.

> +                               mutex_unlock(&curseg->curseg_mutex);
> +                               goto unlock;
> +                       }
> +                       locate_dirty_segment(sbi, segno);
> +                       mutex_unlock(&curseg->curseg_mutex);
> +               }
> +
> +               /* clear warm node, cold node information */
> +               for (type = CURSEG_WARM_NODE; type <= CURSEG_COLD_NODE; type++) {
> +                       struct curseg_info *curseg = CURSEG_I(sbi, type);
> +
> +                       mutex_lock(&curseg->curseg_mutex);
> +                       segno = curseg->segno;
> +                       curseg->segno = NULL_SEGNO;
> +                       curseg->inited = false;
> +                       __set_test_and_free(sbi, segno, false);
> +                       mutex_unlock(&curseg->curseg_mutex);
> +               }
> +               f2fs_notice(sbi, "single node section mode enabled");
> +               sbi->single_node_sec = true;

It looks complicated to enable single_node_sec mode dynamically, what do
you think of making this as a feature which can only be eanbled by mkfs?

Thanks,

> +unlock:
> +               up_write(&SIT_I(sbi)->sentry_lock);
> +               f2fs_up_read(&SM_I(sbi)->curseg_lock);
> +       }
> +do_gc:
>          if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
>                                  sbi->gc_thread->f2fs_gc_task) {
>                  DEFINE_WAIT(wait);
> @@ -3502,6 +3558,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>                  return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
>                                                  inode->i_write_hint);
>          } else {
> +               if (fio->sbi->single_node_sec)
> +                       return CURSEG_HOT_NODE;
> +
>                  if (IS_DNODE(fio->page))
>                          return is_cold_node(fio->page) ? CURSEG_WARM_NODE :
>                                                  CURSEG_HOT_NODE;
> @@ -4116,6 +4175,15 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
>                                                          CURSEG_HOT_NODE]);
>                  blk_off = le16_to_cpu(ckpt->cur_node_blkoff[type -
>                                                          CURSEG_HOT_NODE]);
> +               if (segno == NULL_SEGNO && type != CURSEG_HOT_NODE) {
> +                       if (!test_opt(sbi, SINGLE_NODE_SEC)) {
> +                               f2fs_err(sbi, "single_node_sec option required");
> +                               return -EFAULT;
> +                       }
> +                       sbi->single_node_sec = true;
> +                       return 0;
> +               }
> +
>                  if (__exist_node_summaries(sbi))
>                          blk_addr = sum_blk_addr(sbi, NR_CURSEG_NODE_TYPE,
>                                                          type - CURSEG_HOT_NODE);
> @@ -4884,6 +4952,8 @@ static void init_free_segmap(struct f2fs_sb_info *sbi)
>                  struct curseg_info *curseg_t = CURSEG_I(sbi, type);
> 
>                  __set_test_and_inuse(sbi, curseg_t->segno);
> +               if (sbi->single_node_sec && type == CURSEG_HOT_NODE)
> +                       break;
>          }
>   }
> 
> @@ -5027,6 +5097,10 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>                          f2fs_handle_error(sbi, ERROR_INVALID_CURSEG);
>                          return -EFSCORRUPTED;
>                  }
> +
> +               /* in single node section mode, WARM/COLD NODE are invalid */
> +               if (sbi->single_node_sec && i == CURSEG_HOT_NODE)
> +                       break;
>          }
>          return 0;
>   }
> @@ -5153,6 +5227,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
>          if (!zbd)
>                  return 0;
> 
> +       /* in single node section mode, WARM/COLD node are not valid */
> +       if (sbi->single_node_sec && type > CURSEG_HOT_NODE)
> +               return 0;
> +
>          /* report zone for the sector the curseg points to */
>          zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
>                  << log_sectors_per_block;
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index e1c0f418aa11..152a07e61b5f 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -570,6 +570,8 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>                                  get_ckpt_valid_blocks(sbi, segno, true);
>                  if (node_blocks > left_blocks)
>                          return false;
> +               if (sbi->single_node_sec) /* check only hot node */
> +                       break;
>          }
> 
>          /* check current data section for dentry blocks. */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1f1b3647a998..7e1e80fe58dd 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -129,6 +129,7 @@ enum {
>          Opt_acl,
>          Opt_noacl,
>          Opt_active_logs,
> +       Opt_single_node_sec,
>          Opt_disable_ext_identify,
>          Opt_inline_xattr,
>          Opt_noinline_xattr,
> @@ -207,6 +208,7 @@ static match_table_t f2fs_tokens = {
>          {Opt_acl, "acl"},
>          {Opt_noacl, "noacl"},
>          {Opt_active_logs, "active_logs=%u"},
> +       {Opt_single_node_sec, "single_node_sec"},
>          {Opt_disable_ext_identify, "disable_ext_identify"},
>          {Opt_inline_xattr, "inline_xattr"},
>          {Opt_noinline_xattr, "noinline_xattr"},
> @@ -803,6 +805,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>                                  return -EINVAL;
>                          F2FS_OPTION(sbi).active_logs = arg;
>                          break;
> +               case Opt_single_node_sec:
> +                       set_opt(sbi, SINGLE_NODE_SEC);
> +                       break;
>                  case Opt_disable_ext_identify:
>                          set_opt(sbi, DISABLE_EXT_IDENTIFY);
>                          break;
> @@ -2039,6 +2044,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>                                          F2FS_OPTION(sbi).s_resuid),
>                                  from_kgid_munged(&init_user_ns,
>                                          F2FS_OPTION(sbi).s_resgid));
> +       if (test_opt(sbi, SINGLE_NODE_SEC))
> +               seq_puts(seq, ",single_node_sec");
>   #ifdef CONFIG_F2FS_FAULT_INJECTION
>          if (test_opt(sbi, FAULT_INJECTION)) {
>                  seq_printf(seq, ",fault_injection=%u",
> @@ -3675,6 +3682,9 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>          blocks_per_seg = BLKS_PER_SEG(sbi);
> 
>          for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
> +               /* bypass single node section mode */
> +               if (le32_to_cpu(ckpt->cur_node_segno[i]) == NULL_SEGNO)
> +                       goto check_data;
>                  if (le32_to_cpu(ckpt->cur_node_segno[i]) >= main_segs ||
>                          le16_to_cpu(ckpt->cur_node_blkoff[i]) >= blocks_per_seg)
>                          return 1;
> @@ -3823,6 +3833,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>          init_f2fs_rwsem(&sbi->io_order_lock);
>          spin_lock_init(&sbi->cp_lock);
> 
> +       sbi->single_node_sec = false;
> +
>          sbi->dirty_device = 0;
>          spin_lock_init(&sbi->dev_lock);
> 
> --
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
