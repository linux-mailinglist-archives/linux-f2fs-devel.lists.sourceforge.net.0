Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHoOLwCJCWrteQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 May 2026 11:23:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB235603BF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 May 2026 11:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YHHgLMLYy6meHZvWCOEzyHo0ihUXE1ps2TBozfKMLg=; b=O70kz4RwHDzk0M9O3mv/5POiT6
	/n3qS0ksAgs2TNkA3+jEQC9CrIqMyaPkW/APt+Nmi3LsPDX9aQysWaUmRrR2JsfBiGPQhjDa8RHEc
	bYx4frTdV41Tyeawr0wgtaNzPTKC4A+75OS5oneFJgKQSW/HqhvJ3fMTUIZujWnImxjw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wOXiH-0001G2-VN;
	Sun, 17 May 2026 09:23:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wOXiH-0001Fw-45
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 May 2026 09:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxfzrdlZOt4TLyijWsPcE+R0PVwsX9tTYJy1NfkzlFw=; b=UKBLi6/4OFOYzhCGOmcxQCopbp
 qM/k5YOXktomt70OEnxDSpCBOy9S82+MTA/Q5FnrFLai5tq79YGeFZ8u8Fjq6oZvCKNsKvsDjPHnE
 uQg+OgrIkLxNaNSVBE5mQbM41z+beMlVqdUd5WKGS89u0kioh/ffSBiN4krki2jvlf7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jxfzrdlZOt4TLyijWsPcE+R0PVwsX9tTYJy1NfkzlFw=; b=V+mDoyOH5wMDPu5HOeITHOqhrY
 sQTvPPjISqIjrCS5TBdavrIg1G8SEdM2Rew+tC7ofP/RLTj4txz4lxX406gjkBamOroO1IblSfC2t
 c3K5X2lpd08Fvfo197pr0cAaakeK0fqJcRrGCgff5ANSiykLVF41I35kz7iMMItRVZw0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wOXiG-0002mX-NW for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 May 2026 09:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D98914447D;
 Sun, 17 May 2026 09:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9103BC2BCB0;
 Sun, 17 May 2026 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1779009783;
 bh=4nksWu0m5kxHNf0/X0U5fvtysZjFrwrOvwoPmJNHSKU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aTP7OWrQ6YIlqjMcCZu2BrR4gIeqWaTpESdTjMJs9T4/v91oq/FWb8V50PE3cikD3
 Nq9G3DH8FnhTuPIItmpPySCbWFH66FRwlKIbcyJuzr5d50r39XJiC1CH9pRQANmTYm
 RHR2F11izf5hItFC1kBGKxYQaG5gU1SUtFu3JqljsVTVhzHhQ1+EzeSXqrgDEuB9Hc
 oJGGMuL1XPYkjDTf1s4hEuhRCZIjS2fub7CqOh3e/BVVhL7uF9S9tsD+zkuTyAVM0Z
 KocYkTpWMWB4avrCTxMt08Ld9tQHnaAZGV1gTSExBApfQUTpfoPNJ3a23dgp1CQvdR
 uc9eN0e7+z+TA==
Message-ID: <76b19184-4b2e-445f-91a1-2f4cf48a3804@kernel.org>
Date: Sun, 17 May 2026 17:22:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Deepanshu Kartikey <kartikey406@gmail.com>, jaegeuk@kernel.org
References: <20260510042336.94751-1-kartikey406@gmail.com>
Content-Language: en-US
In-Reply-To: <20260510042336.94751-1-kartikey406@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/10/2026 12:23 PM,
 Deepanshu Kartikey wrote: > When f2fs_get_valid_checkpoint()
 fails during mount (e.g. due to an > invalid checkpoint CRC on a malformed
 image), f2fs_fill_super() takes > an erro [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: syzkaller.appspot.com]
X-Headers-End: 1wOXiG-0002mX-NW
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: initialize ino_entry_info before
 checkpoint load
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
Cc: stable@kernel.org, syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 1CB235603BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kartikey406@gmail.com,m:jaegeuk@kernel.org,m:stable@kernel.org,m:syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,appspotmail.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,eec8f2693d71386bd600];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 5/10/2026 12:23 PM, Deepanshu Kartikey wrote:
> When f2fs_get_valid_checkpoint() fails during mount (e.g. due to an
> invalid checkpoint CRC on a malformed image), f2fs_fill_super() takes
> an error path that eventually calls iput() on the root inode. This
> invokes f2fs_drop_inode() -> f2fs_exist_written_data(), which acquires
> sbi->im[]->ino_lock. However, f2fs_init_ino_entry_info() has not run
> yet at this point, so the spinlock is uninitialized and lockdep
> complains:
> 
>    F2FS-fs (loop0): invalid crc value
>    F2FS-fs (loop0): Failed to get valid F2FS checkpoint
>    INFO: trying to register non-static key.
>    The code is fine but needs lockdep annotation, or maybe
>    you didn't initialize this object before use?
>    ...
>     f2fs_exist_written_data+0x53/0x90 fs/f2fs/checkpoint.c:787
>     f2fs_drop_inode+0xda/0xbf0 fs/f2fs/super.c:1852
>     iput+0x651/0xe80 fs/inode.c:2009
>     f2fs_fill_super+0x6047/0x7850 fs/f2fs/super.c:5461
> 
> Move f2fs_init_ino_entry_info() to before f2fs_get_valid_checkpoint()
> so that sbi->im[] is always fully initialized before any error path
> can trigger iput() -> f2fs_drop_inode(). The init function only
> depends on raw superblock fields (BLKS_PER_SEG, F2FS_CP_PACKS,
> NR_CURSEG_PERSIST_TYPE, __cp_payload), which are populated well
> before checkpoint load, so the move is safe.
> 
> Fixes: 3063c80776e3 ("f2fs: another way to set large folio by remembering inode number")
> Cc: stable@kernel.org
> Reported-by: syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=eec8f2693d71386bd600
> Tested-by: syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
