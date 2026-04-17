Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK2rCcr24Wn50AAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 11:00:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD3C41900B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 11:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoq2PtPYY7gq0ofvEYdPT4mEJqng7xPy2KL6hayBTTc=; b=iHZBei9kw1QyIUhsnFz85JUpri
	3LAncTt4e5jxtRYs5XclvkTMDVao43McFiXFiq5rMynV066QspDzQmriXzx1jJrn2w6uN50efHd02
	YdOfn+3GG1Oxx7h5aedLf3F85tBsv0mh98WEHmF81ydNLzkvgYGlhmjiYSHPpBPYdpSQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDf41-00047O-W2;
	Fri, 17 Apr 2026 09:00:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wDf40-00047C-PZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 09:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H3wBxZEayv6s7zG1sIDbVcqolgjWxJfgltfr2jNmyG0=; b=FCKzZZ9jRH4UZDkA4Tabm7iZ0W
 m/KimhYkXuKLHBEyKpjTlaarPGiiYmhFs/1w0qXaNp5A++FSgeXqrcedSLIncw3Ty85JI9L6/sd/3
 tgajtP5Mu7EWXyxg6AEq2og2RQ0xheF2sLZaKczPwpTCzdOmzzfe/KUSuhnkfpgPGTHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H3wBxZEayv6s7zG1sIDbVcqolgjWxJfgltfr2jNmyG0=; b=gwYIJy/Iw/hDNaM/xM2lR4L3WN
 5e2YgGE5vC9okBXgAioN2xRTKXC/o4sImCI/6GPYtybd3v1845BrN4U/VX7RWz5F32br4u30YxqdX
 BPdf/8CMbPjZrk0SDJYCuREG8n9NhmOqF2DBBX9fsL9dTuTg1ucFyWnruYJPF3vnlkso=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wDf40-00074o-TB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 09:00:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 85758439CF;
 Fri, 17 Apr 2026 09:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31100C2BCB4;
 Fri, 17 Apr 2026 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776416426;
 bh=BLAt2TF7xaEkO6haokGj/M1AbfbptHHhunHMjI+FzF8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TK5wESFmUIWzcGe5ZgxgMILX5pC7k4UVY6SgjyaDJLO8TxvePud986OEzO9qv8XrW
 J/pYy1Wwl5TS/5fmcEzbic5lVxPc5ZgUwzEDrmAl18qlyfoAuwnKUc4bsCjQ5QZtgV
 Y5M2ZJ5i37cHDiOjnPqllJ+PYab832yXKk11cSPW6qAgowN7LqhPMvmgb1hd1nQhTT
 jkGtoUntWFHo3rkMp4mf1VRapto7j23T41aVCrIxXycxhA93aEUDiHxAKBl9mA3mN4
 wWu3Kgeh5VmUUhEZovk6LMJf7wW3kPGDVppV9+76gslHwJ7a6xAGobRvP3NUwvg00N
 QMvySouEaqbgw==
Message-ID: <f997ceb6-85d1-4872-be06-2a50469b3b18@kernel.org>
Date: Fri, 17 Apr 2026 17:00:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260403144015.221811-3-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260403144015.221811-3-monty_pavel@sina.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/3/26 22:40, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > f2fs_destroy_extent_node() does not set
 FI_NO_EXTENT
 before clearing > extent nodes. When called from f2fs_dro [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wDf40-00074o-TB
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix node_cnt race between extent node
 destroy and writeback
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	ASN_FAIL(0.00)[7.38.105.216.asn.rspamd.com:query timed out];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-f2fs-devel.lists.sourceforge.net:query timed out,chao.kernel.org:query timed out];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: BBD3C41900B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 22:40, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> f2fs_destroy_extent_node() does not set FI_NO_EXTENT before clearing
> extent nodes. When called from f2fs_drop_inode() with I_SYNC set,
> concurrent kworker writeback can insert new extent nodes into the same
> extent tree, racing with the destroy and triggering f2fs_bug_on() in
> __destroy_extent_node(). The scenario is as follows:
> 
> drop inode                            writeback
>   - iput
>    - f2fs_drop_inode  // I_SYNC set
>     - f2fs_destroy_extent_node
>      - __destroy_extent_node
>       - while (node_cnt) {
>          write_lock(&et->lock)
>          __free_extent_tree
>          write_unlock(&et->lock)
>                                         - __writeback_single_inode
>                                          - f2fs_outplace_write_data
>                                           - f2fs_update_read_extent_cache
>                                            - __update_extent_tree_range
>                                             // FI_NO_EXTENT not set,
>                                             // insert new extent node
>         } // node_cnt == 0, exit while
>       - f2fs_bug_on(node_cnt)  // node_cnt > 0
> 
> Additionally, __update_extent_tree_range() only checks FI_NO_EXTENT for
> EX_READ type, leaving EX_BLOCK_AGE updates completely unprotected.
> 
> This patch set FI_NO_EXTENT under et->lock in __destroy_extent_node(),
> consistent with other callers (__update_extent_tree_range and
> __drop_extent_tree) and check FI_NO_EXTENT for both EX_READ and
> EX_BLOCK_AGE tree.

I suffered below test failure, then I bisect to this change.

     generic/475  84s ... [failed, exit status 1]- output mismatch (see /share/git/fstests/results//generic/475.out.bad)
     --- tests/generic/475.out   2025-01-12 21:57:40.279440664 +0800
     +++ /share/git/fstests/results//generic/475.out.bad 2026-04-17 12:08:28.000000000 +0800
     @@ -1,2 +1,6 @@
      QA output created by 475
      Silence is golden.
     +mount: /mnt/scratch_f2fs: mount system call failed: Structure needs cleaning.
     +       dmesg(1) may have more information after failed mount system call.
     +mount failed
     +(see /share/git/fstests/results//generic/475.full for details)
     ...
     (Run 'diff -u /share/git/fstests/tests/generic/475.out /share/git/fstests/results//generic/475.out.bad'  to see the entire diff)


     generic/388  73s ... [failed, exit status 1]- output mismatch (see /share/git/fstests/results//generic/388.out.bad)
     --- tests/generic/388.out   2025-01-12 21:57:40.275440602 +0800
     +++ /share/git/fstests/results//generic/388.out.bad 2026-04-17 11:58:05.000000000 +0800
     @@ -1,2 +1,6 @@
      QA output created by 388
      Silence is golden.
     +mount: /mnt/scratch_f2fs: mount system call failed: Structure needs cleaning.
     +       dmesg(1) may have more information after failed mount system call.
     +cycle mount failed
     +(see /share/git/fstests/results//generic/388.full for details)
     ...
     (Run 'diff -u /share/git/fstests/tests/generic/388.out /share/git/fstests/results//generic/388.out.bad'  to see the entire diff)


     F2FS-fs (dm-0): sanity_check_extent_cache: inode (ino=1761) extent info [220057, 57, 6] is incorrect, run fsck to fix

I suspect we may miss any extent updates after we set FI_NO_EXTENT in
__destroy_extent_node(), result in failing in sanity_check_extent_cache().

Can we just relocate f2fs_bug_on(node_cnt) rather than complicated change?
Thoughts?

Thanks,

> 
> Fixes: 3fc5d5a182f6 ("f2fs: fix to shrink read extent node in batches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/extent_cache.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 0ed84cc065a7..87169fd29d89 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -119,9 +119,10 @@ static bool __may_extent_tree(struct inode *inode, enum extent_type type)
>   	if (!__init_may_extent_tree(inode, type))
>   		return false;
>   
> +	if (is_inode_flag_set(inode, FI_NO_EXTENT))
> +		return false;
> +
>   	if (type == EX_READ) {
> -		if (is_inode_flag_set(inode, FI_NO_EXTENT))
> -			return false;
>   		if (is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
>   				 !f2fs_sb_has_readonly(F2FS_I_SB(inode)))
>   			return false;
> @@ -644,6 +645,8 @@ static unsigned int __destroy_extent_node(struct inode *inode,
>   
>   	while (atomic_read(&et->node_cnt)) {
>   		write_lock(&et->lock);
> +		if (!is_inode_flag_set(inode, FI_NO_EXTENT))
> +			set_inode_flag(inode, FI_NO_EXTENT);
>   		node_cnt += __free_extent_tree(sbi, et, nr_shrink);
>   		write_unlock(&et->lock);
>   	}
> @@ -688,12 +691,12 @@ static void __update_extent_tree_range(struct inode *inode,
>   
>   	write_lock(&et->lock);
>   
> -	if (type == EX_READ) {
> -		if (is_inode_flag_set(inode, FI_NO_EXTENT)) {
> -			write_unlock(&et->lock);
> -			return;
> -		}
> +	if (is_inode_flag_set(inode, FI_NO_EXTENT)) {
> +		write_unlock(&et->lock);
> +		return;
> +	}
>   
> +	if (type == EX_READ) {
>   		prev = et->largest;
>   		dei.len = 0;
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
