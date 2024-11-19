Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA89D1FF1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2024 07:06:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDHND-0003kC-FB;
	Tue, 19 Nov 2024 06:06:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tDHNC-0003k1-1y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 06:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cMLknVhTGmTqgi1WjUQU8QbyZbLlf0x1c7v3gM2wJT8=; b=cZKepH8PcgHpxY01bRZo6o6PmA
 5hhSWxo0HO55sdgs3rJhfNE68UDExexleLB2b/rkq56OWIMfzQd3aLXN2WiKlD2agaZ6g6x5SHzS4
 CgjPOMLq5KHU7X7J79z/63lqe4SPuRYf1D8iwJIShUEbUkNboy/BZcDWv3K/lp1PpfrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cMLknVhTGmTqgi1WjUQU8QbyZbLlf0x1c7v3gM2wJT8=; b=JrUXSlEN1jQHWvZDAGXhnohmMi
 Gse1SPj2gihB+q+jwB7Y2cMN+qYHgqPs7PSWgpsLZxQsdZMJkSrhMmdtWhG9M+aG1XeI1lJUumd5q
 zWvXzyEuEInNA5XTrlpJnUO8wIBdmg8F99uu4lhtc1QsClSfu0CFA7TDSs2iqcuiy7pI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tDHNA-0002Ol-5u for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 06:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9D6CD5C4B05;
 Tue, 19 Nov 2024 06:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757D1C4CEDA;
 Tue, 19 Nov 2024 06:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731996349;
 bh=xePXyP7ebkzzCGKOqeQWr1/POG8ku3mwGPWZLIRUfT8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rCOOqkwYrEUm53qH7CqYpO+pmH/EjVjdmQumHb7WrO+WsUSS0Xq/Ko2aNsLHMcruT
 P8vcTkgQGcDiu2F2HCh+0ITjFViGiVnMQds32AZa9EqYVpj0GI2voGk22OwMLWpwo7
 yiwNC1nYCZ9rwGskwj6dY5iEifgKesxCkv826rq8CC8VptQ2i/qnbNCC/IkqZanHH9
 Y0gnxsLdj5jIm+ODME7gk9/QucRpxUxD545FiT7rYgz/QD3gNqxH4mHjHOnOrIo4eZ
 48HN3oyk7P58nVz3syrfFA3yuMpUBmhj5fel2mBFzNzY/o9QMyqzfE3hRJrBYts4V9
 +lrVZDqpiOyxA==
Message-ID: <fb436fdb-a4eb-49cc-a730-354611e88b21@kernel.org>
Date: Tue, 19 Nov 2024 14:05:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiuhong Wang <xiuhong.wang@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20241112110627.1314632-1-xiuhong.wang@unisoc.com>
Content-Language: en-US
In-Reply-To: <20241112110627.1314632-1-xiuhong.wang@unisoc.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/12 19:06, Xiuhong Wang wrote: > We encountered
 a system hang problem based on the following > experiment: > There are 17
 processes, 8 of which do 4k data read, write and > compare tests, an [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tDHNA-0002Ol-5u
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix to avoid long time to shrink
 extent cache
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hao_hao.wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/12 19:06, Xiuhong Wang wrote:
> We encountered a system hang problem based on the following
> experiment:
> There are 17 processes, 8 of which do 4k data read, write and
> compare tests, and 8 do 64k read, write and compare tests. Each
> thread writes a 256M file, and another thread writes a large file
> to 80% of the disk, and then keeps doing read operations, all of
> which are direct operations. This will cause the large file to be
> filled to 80% of the disk to be severely fragmented. On a 512GB
> device, this large file may generate a huge zombie extent tree.
> 
> When system shutting down, the init process needs to wait for the
> writeback process, and the writeback process may encounter the
> situation where the READ_EXTENT_CACHE space is insufficient and
> needs to free the zombie extent tree. The extent tree has a large
> number of extent nodes, it will a long free time to free, which
> triggers system hang.
 > > The stack when the problem occurs is as follows:
> crash_arm64> bt 1
> PID: 1        TASK: ffffff80801a9200  CPU: 1    COMMAND: "init"
>   #0 [ffffffc00806b9a0] __switch_to at ffffffc00810711c
>   #1 [ffffffc00806ba00] __schedule at ffffffc0097c1c4c
>   #2 [ffffffc00806ba60] schedule at ffffffc0097c2308
>   #3 [ffffffc00806bab0] wb_wait_for_completion at ffffffc0086320d4
>   #4 [ffffffc00806bb20] writeback_inodes_sb at ffffffc00863719c
>   #5 [ffffffc00806bba0] sync_filesystem at ffffffc00863c98c
>   #6 [ffffffc00806bbc0] f2fs_quota_off_umount at ffffffc00886fc60
>   #7 [ffffffc00806bc20] f2fs_put_super at ffffffc0088715b4
>   #8 [ffffffc00806bc60] generic_shutdown_super at ffffffc0085cd61c
>   #9 [ffffffc00806bcd0] kill_f2fs_super at ffffffc00886b3dc
> 
> crash_arm64> bt 14997
> PID: 14997    TASK: ffffff8119d82400  CPU: 3    COMMAND: "kworker/u16:0"
>   #0 [ffffffc019f8b760] __detach_extent_node at ffffffc0088d5a58
>   #1 [ffffffc019f8b790] __release_extent_node at ffffffc0088d5970
>   #2 [ffffffc019f8b810] f2fs_shrink_extent_tree at ffffffc0088d5c7c
>   #3 [ffffffc019f8b8a0] f2fs_balance_fs_bg at ffffffc0088c109c
>   #4 [ffffffc019f8b910] f2fs_write_node_pages at ffffffc0088bd4d8
>   #5 [ffffffc019f8b990] do_writepages at ffffffc0084a0b5c
>   #6 [ffffffc019f8b9f0] __writeback_single_inode at ffffffc00862ee28
>   #7 [ffffffc019f8bb30] writeback_sb_inodes at ffffffc0086358c0
>   #8 [ffffffc019f8bc10] wb_writeback at ffffffc0086362dc
>   #9 [ffffffc019f8bcc0] wb_do_writeback at ffffffc008634910
> 
> Process 14997 ran for too long and caused the system hang.
> 
> At this time, there are still 1086911 extent nodes in this zombie
> extent tree that need to be cleaned up.
> 
> crash_arm64_sprd_v8.0.3++> extent_tree.node_cnt ffffff80896cc500
>    node_cnt = {
>      counter = 1086911
>    },
> 
> The root cause of this problem is that when the f2fs_balance_fs
> function is called in the write process, it will determine
> whether to call f2fs_balance_fs_bg, but it is difficult to
> meet the condition of excess_cached_nats. When the
> f2fs_shrink_extent_tree function is called to free during
> f2fs_write_node_pages, there are too many extent nodes on the
> extent tree, which causes a loop and causes a system hang.
> 
> To solve this problem, when calling f2fs_balance_fs, check whether
> the extent cache is sufficient. If not, release the zombie extent
> tree.
> 
> Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> Test the problem with the temporary versions:
> patch did not reproduce the problem, the patch is as follows:
> @@ -415,7 +415,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>                  f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_FAULT_INJECT);
> 
>          /* balance_fs_bg is able to be pending */
> -       if (need && excess_cached_nats(sbi))
> +       if (need)
>                  f2fs_balance_fs_bg(sbi, false);
> 
> ---
>   fs/f2fs/segment.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 1766254279d2..390bec177567 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -415,7 +415,9 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_FAULT_INJECT);
>   
>   	/* balance_fs_bg is able to be pending */
> -	if (need && excess_cached_nats(sbi))
> +	if (need && (excess_cached_nats(sbi) ||
> +			!f2fs_available_free_memory(sbi, READ_EXTENT_CACHE) ||
> +			!f2fs_available_free_memory(sbi, AGE_EXTENT_CACHE)))

Hi,

I doubt if there is no enough memory, we may still run into
f2fs_shrink_extent_tree() and suffer such long time delay.

So, can we just let __free_extent_tree() break the loop once we have
released entries w/ target number? something like this:

---
  fs/f2fs/extent_cache.c | 15 ++++++++++-----
  1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 019c1f7b7fa5..38c71c1c4fb7 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -379,11 +379,12 @@ static struct extent_tree *__grab_extent_tree(struct inode *inode,
  }

  static unsigned int __free_extent_tree(struct f2fs_sb_info *sbi,
-					struct extent_tree *et)
+				struct extent_tree *et, unsigned int nr_shrink)
  {
  	struct rb_node *node, *next;
  	struct extent_node *en;
  	unsigned int count = atomic_read(&et->node_cnt);
+	unsigned int i = 0;

  	node = rb_first_cached(&et->root);
  	while (node) {
@@ -391,6 +392,9 @@ static unsigned int __free_extent_tree(struct f2fs_sb_info *sbi,
  		en = rb_entry(node, struct extent_node, rb_node);
  		__release_extent_node(sbi, et, en);
  		node = next;
+
+		if (nr_shrink && ++i >= nr_shrink)
+			break;
  	}

  	return count - atomic_read(&et->node_cnt);
@@ -761,7 +765,7 @@ static void __update_extent_tree_range(struct inode *inode,
  	}

  	if (is_inode_flag_set(inode, FI_NO_EXTENT))
-		__free_extent_tree(sbi, et);
+		__free_extent_tree(sbi, et, 0);

  	if (et->largest_updated) {
  		et->largest_updated = false;
@@ -942,7 +946,8 @@ static unsigned int __shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink
  	list_for_each_entry_safe(et, next, &eti->zombie_list, list) {
  		if (atomic_read(&et->node_cnt)) {
  			write_lock(&et->lock);
-			node_cnt += __free_extent_tree(sbi, et);
+			node_cnt += __free_extent_tree(sbi, et,
+					nr_shrink - node_cnt - tree_cnt);
  			write_unlock(&et->lock);
  		}
  		f2fs_bug_on(sbi, atomic_read(&et->node_cnt));
@@ -1095,7 +1100,7 @@ static unsigned int __destroy_extent_node(struct inode *inode,
  		return 0;

  	write_lock(&et->lock);
-	node_cnt = __free_extent_tree(sbi, et);
+	node_cnt = __free_extent_tree(sbi, et, 0);
  	write_unlock(&et->lock);

  	return node_cnt;
@@ -1117,7 +1122,7 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
  		return;

  	write_lock(&et->lock);
-	__free_extent_tree(sbi, et);
+	__free_extent_tree(sbi, et, 0);
  	if (type == EX_READ) {
  		set_inode_flag(inode, FI_NO_EXTENT);
  		if (et->largest.len) {
-- 
2.40.1

Thanks,

>   		f2fs_balance_fs_bg(sbi, false);
>   
>   	if (!f2fs_is_checkpoint_ready(sbi))



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
