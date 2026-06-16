Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XCObBfrnMGpZYgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 08:06:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B296A68C5C3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 08:06:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="gnBWckZ/";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=SzY+Aov4;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=nOWmpl6c;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Ys0gv1As;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3X0gIV08OSORLh2ZORj1NrVLwedGCwbMRDYeZ/K+6ZI=; b=gnBWckZ/Zggxzp0vnTpLKvI8hq
	uAtqMvXcvGJ/X69/K5YP99I2BYTaHWTOeg2+JYnDEkej8d1zc5HG8xqfHSOauog1OtyRcdOSzthjp
	LVKBoVgHl13U62+6LLnKji1LLuR8hR4hUTcL0sxyJsMR/jHXsg0RRuLw0abYl8st1qAY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZMwY-00006g-8n;
	Tue, 16 Jun 2026 06:06:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1wZMwX-00006Z-JT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 06:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8skaFAn8iWz1oYQUx+F0nQwHC7XAZ27/HYL8nRZKzuQ=; b=SzY+Aov4ColCcDQreJhphPnWN8
 bYY0+IsC6ugNsQOAslqnCrtRwoErIrPf/0T4MdD4ZGsPDy27k1NRGg7Djz4mZr8olngYKqDl0X02T
 wOuHQoVeKWxiXWpcaCAKt7XN9QaynmVwMs7HiSTHRT5o67Cy/YnPtXxUomhNNFxpjBLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8skaFAn8iWz1oYQUx+F0nQwHC7XAZ27/HYL8nRZKzuQ=; b=nOWmpl6cGF0QRAjy/Zs6Psd3Mn
 LJ3Op2z21T00QpTldOld36LdgkK520AbHAkvhdcZJk76AtsK6/ovIiCh2NAuvVTrQQLWI/8lcHuVO
 QmYMjnNL+6GhbuAEmfqt/7RXr8NS30TI1RrcXWNQXbBoKA7cIEl5uOE84Bbp3TPnWO7A=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZMwS-0006b3-Sl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 06:06:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D2E6F4354E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 06:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6AA1F000E9;
 Tue, 16 Jun 2026 06:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781589987;
 bh=8skaFAn8iWz1oYQUx+F0nQwHC7XAZ27/HYL8nRZKzuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Ys0gv1AsAR4Uu3fqzwbinne90Nsc6ytcdAegYIFHH3MqIo9dEcl0IAYzI2+5NUTha
 jbC1oYuQbv7dXsIvyRDVZAzknrhNxJDmS2vReOFJNux9OT3wGyxEjfuoYs2O1egBqs
 uOHca+WBtXUzVXsjjxZEOQjIw8KIjYOXbxnxnSbHzx0jDnMyAKrUOsqz3h3ay3/Pa/
 VYd4OGq+htQsC3AWEoMwBuSDeyJQTTpkyY0UcjI8fxmfWWxgCcCsvmxVIz/BpzTf1j
 KHDAcR0z9uM25x1tobgF5QFTrhID08i4hfGtNXyJgOf/fwoffLPfrNcBaJdivwAaE8
 4yJJLfGoVGLyQ==
Date: Tue, 16 Jun 2026 14:06:21 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <ajDkil_W3kK-jW8c@zlang-mailbox>
Mail-Followup-To: Chao Yu <chao@kernel.org>, fstests@vger.kernel.org, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20260615090558.1627456-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260615090558.1627456-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 15, 2026 at 09:05:58AM +0000, Chao Yu wrote: >
 f2fs has supported ioctl(_IOR ('X', 125, uint32_t)),
 so that > "f2fs_io shutdown"
 can be completely replaced w/ _scratch_shutdown(), > let's [...] 
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
X-Headers-End: 1wZMwS-0006b3-Sl
Subject: Re: [f2fs-dev] [PATCH] f2fs/009: use common _scratch_shutdown helper
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@kernel.org>
Cc: jaegeuk@kernel.org, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[zlang@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zlang-mailbox:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B296A68C5C3

On Mon, Jun 15, 2026 at 09:05:58AM +0000, Chao Yu wrote:
> f2fs has supported ioctl(_IOR ('X', 125, uint32_t)), so that
> "f2fs_io shutdown" can be completely replaced w/ _scratch_shutdown(),
> let's clean up in f2fs/009.
> 
> Suggested-by: Zorro Lang <zlang@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/009 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/f2fs/009 b/tests/f2fs/009
> index fa4a39d16..39a4bad3d 100755
> --- a/tests/f2fs/009
> +++ b/tests/f2fs/009
> @@ -12,6 +12,7 @@
>  _begin_fstest auto quick
>  
>  _require_scratch
> +_require_scratch_shutdown
>  _require_inject_f2fs_command node i_links
>  _require_command "$(type -P socket)" socket
>  
> @@ -106,7 +107,7 @@ ino=`stat -c '%i' $filename`
>  $F2FS_IO_PROG write 1 0 1 zero atomic_commit $filename 5000 >> $seqres.full 2>&1 &
>  stat $filename >> $seqres.full
>  rm $filename
> -$F2FS_IO_PROG shutdown 1 $SCRATCH_MNT/ >> $seqres.full
> +_scratch_shutdown -f

Great! Glad to see fs specific code being replaced by common helper.

Reviewed-by: Zorro Lang <zlang@kernel.org>

>  sleep 6
>  check_links 1 0 $ino
>  
> -- 
> 2.49.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
