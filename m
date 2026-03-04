Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHTuLZt+p2kjiAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 01:36:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BC11F8EE3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 01:36:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NsHqI14OpMuYpjPWH7SQ3zT1DZ/8shY055Hk2kVOcA=; b=bOfm7zRb11frJsPGV1PGQ73Ad5
	B/oxAII4Irk+UuexBm7wsX967sJUEEqqrbWeLbzwSLz9WNr5+rPEYM3QqA5j0fKFfd0PE+15QXTIS
	fQLJ1S3tOfhgzfWFkH8R3dF8JePmRz7zXBhzre5JAQ4kB1/2BHk/JzVWC2NuhvsyJeoo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxaE4-0007rn-8s;
	Wed, 04 Mar 2026 00:36:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vxaDm-0007rA-EO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 00:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xES0UW6Sqk+FnJgQ7oqyrYRf+oIOU+sjpqhW3cUKiv0=; b=IYRQ50rMWJSe7EmOjuhU0+JjIg
 Ks9t8fQh6KNLLkUgRN2VCy9JLjNKpsshbj78ckiIu4mvqslnS8kr5EI1ujX885ZOZLhvnUetQREdu
 hn3fnjZO9X+K/al20iCW1WLrgiLurZiUSOTIuhs3TXvVjclcxV0jrLZ0pmFyag2fv5pE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xES0UW6Sqk+FnJgQ7oqyrYRf+oIOU+sjpqhW3cUKiv0=; b=PAhiFV5nZ9XkLCUKLeto5wephq
 eKaE793xxPh2nE3tCuNQh2EHTKCdksHZjDW6eJukUiVjfRFt8YIejhp2uFthsbRcqUEhnDMnl8i9G
 f3TRY5over03kg5/A4leLfEx5pWANM1nb5gr40Y94O7E+PBIgfCrp09FIQNte3ykvRjU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxaDm-0004rb-1C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 00:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA80540B00;
 Wed,  4 Mar 2026 00:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F783C116C6;
 Wed,  4 Mar 2026 00:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772584563;
 bh=H1uhE52l0NdlL0DzS2ZP5duN1wYKtufIOeOTS6Cnn3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qxATxzS5oROKJjTc7CQVBJnZDo2wXAgy1wDXg3dXdyR76rIx/HcT0IWfJcpAmfbgs
 LTi0B9xKRnaa1GbnuGDSB43jzBDFKqbsR7vn6QkKF7L0Dilpatbb+VOMbsvT85frkx
 3g0gvBzgxpRGUyTI+cBMzqsWdnu8HRv4W5mfmtlFvzANfIjluLl12Zqo8lJykBU3xx
 cLtH4ILUVEeiWDEJMVRGiN6eg7cbtiAWnNzVevXfcRgPVdHDq3Urnad4GmKwU+cQpV
 HTL7bRZ68C9FYBo47lhp3rj6015TCyxg48HTdUBd+23DAJNJlgiJQYpxW5LvbPYySp
 /UBFhO58VMmTQ==
Date: Tue, 3 Mar 2026 16:35:51 -0800
To: syzbot <syzbot+cf7946ab25b21abc4b66@syzkaller.appspotmail.com>,
 chao@kernel.org
Message-ID: <20260304003551.GC57956@quark>
References: <69a75fe1.a70a0220.b118c.0014.GAE@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69a75fe1.a70a0220.b118c.0014.GAE@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 03, 2026 at 02:25:37PM -0800, syzbot wrote: >
 BUG: memory leak > unreferenced object 0xffff888127f70830 (size 16): > comm
 "syz.0.23", pid 6144, jiffies 4294943712 > hex dump (first 16 byte [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxaDm-0004rb-1C
Subject: Re: [f2fs-dev] [syzbot] [fscrypt?] [f2fs?] memory leak in
 fscrypt_setup_filename
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: tytso@mit.edu, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 52BC11F8EE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:syzbot+cf7946ab25b21abc4b66@syzkaller.appspotmail.com,m:chao@kernel.org,m:tytso@mit.edu,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:jaegeuk@kernel.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cf7946ab25b21abc4b66];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:25:37PM -0800, syzbot wrote:
> BUG: memory leak
> unreferenced object 0xffff888127f70830 (size 16):
>   comm "syz.0.23", pid 6144, jiffies 4294943712
>   hex dump (first 16 bytes):
>     3c af 57 72 5b e6 8f ad 6e 8e fd 33 42 39 03 ff  <.Wr[...n..3B9..
>   backtrace (crc 925f8a80):
>     kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>     slab_post_alloc_hook mm/slub.c:4520 [inline]
>     slab_alloc_node mm/slub.c:4844 [inline]
>     __do_kmalloc_node mm/slub.c:5237 [inline]
>     __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5250
>     kmalloc_noprof include/linux/slab.h:954 [inline]
>     fscrypt_setup_filename+0x15e/0x3b0 fs/crypto/fname.c:364
>     f2fs_setup_filename+0x52/0xb0 fs/f2fs/dir.c:143
>     f2fs_rename+0x159/0xca0 fs/f2fs/namei.c:961
>     f2fs_rename2+0xd5/0xf20 fs/f2fs/namei.c:1308

The following commit added a call to f2fs_setup_filename() without a
matching call to f2fs_free_filename():

    commit 40b2d55e045222dd6de2a54a299f682e0f954b03
    Author: Chao Yu <chao@kernel.org>
    Date:   Wed Feb 7 15:05:48 2024 +0800

        f2fs: fix to create selinux label during whiteout initialization

Chao, do you want to handle fixing this?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
