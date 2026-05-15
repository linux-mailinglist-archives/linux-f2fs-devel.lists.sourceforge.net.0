Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJd3NfRoB2qZ2AIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2026 20:41:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F75566AE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2026 20:41:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwAUlAa1Imc5Te/mFwalqIkTsMzHjJoD2yPh1g1lUS0=; b=h1/tpnF4Z/aTeyAMjihLJYLwL3
	fWT8GFlryA7k0hQ0nFaARyPUg0ro6hKzABlG2ah3X8xUvGYD8OTUA3qpHTkvGshYHyn2Ns3rVhOPQ
	MW0GHNAsvOiJXY+KhaS7eM3nlyKyxy9WyoIyertOJ+kyJHKRXIAMOIw9Mspu/bBU0btA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wNxTm-0000ED-2A;
	Fri, 15 May 2026 18:41:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wNxTk-0000E4-65
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 18:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cP+f2o6kMyOQtDwdZGxSxYvNyEezGmEGO/I+oxNfelk=; b=PTe4evJYUXRStWGecNGhXLPJ3r
 /Q3WStsIE7dRmSg2LYpfvTE8n9xJVE2bSeKY2H2dlNX96ZW7r2JsifT7vd5Lct9nLCeWZifS+8+cH
 cFNmEkz9rN7ZD2+xxriVuDidcCqL9WQgv824V5Ui6gCjk4qPVogpRss/wjBO57C5qlh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cP+f2o6kMyOQtDwdZGxSxYvNyEezGmEGO/I+oxNfelk=; b=JmMB+jIfN6smrqD/uz9rkErBfy
 a5nQYLDri8jR5xhg1oKI77SYkEjdS9GL+GB/3sRpGFtgXq8s2un6Zw6inwmzjjfvvZCYFzsUJMpuG
 Sz2n70Fb5Eymeq+8x5e0+4rPKzX2UJ7BemjhGV4xmp5N81IgdF6JgQfNvfLmqraWb+VU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wNxTi-0007na-TG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 18:41:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E20C043524;
 Fri, 15 May 2026 18:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144C5C2BCB0;
 Fri, 15 May 2026 18:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778870492;
 bh=GwivGZO8Wm6h0va9M4mOP/dflJKHX49qqSGVDT/xeJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dQAgJ68JBJiEVYcWN4KUfoFOjI43S8lEmAduuVLNtLsWgJCkCJUESQKxYZzxS4FPG
 6r4b0sekFeMfqq6CecYHs/3GGSFY11ojQC5SPUUX48cjQDLvPKcA6RggznQ5UIw378
 gkBEh8QdYrxHdqGBC7FENxInFyJNa07gtI5npZhFWAZ+ZOOAHSIh6dsnoK4DRayLb9
 xc6guYJ30CVzhDg9jk5AYfWOfo1iH5P4jT21xVAP03kLnMQ64oxvS9KnvsYN2sy7Mi
 aPVkBTySkovP47fajmYy7NH2X/xnGPIY/wGLqXeRZMK1PNEBcXiPJqO9kmrFkftM7r
 oY58+9YIUJLlA==
Date: Fri, 15 May 2026 11:41:24 -0700
To: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Message-ID: <20260515184124.GA4903@quark>
References: <20260513100431.299904-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260513100431.299904-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 13, 2026 at 06:04:27PM +0800, LiaoYuanhong-vivo
 wrote: > From: Liao Yuanhong <liaoyuanhong@vivo.com> > > F2FS currently avoids
 inline data for encrypted regular files. This is > because in [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: sashiko.dev]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wNxTi-0007na-TG
Subject: Re: [f2fs-dev] [PATCH 0/3] f2fs: support encrypted inline data
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
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 "open list:FSCRYPT: FILE SYSTEM LEVEL ENCRYPTION SUPPORT"
 <linux-fscrypt@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 153F75566AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:liaoyuanhong@vivo.com,m:tytso@mit.edu,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:skhan@linuxfoundation.org,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:email,sashiko.dev:url,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 06:04:27PM +0800, LiaoYuanhong-vivo wrote:
> From: Liao Yuanhong <liaoyuanhong@vivo.com>
> 
> F2FS currently avoids inline data for encrypted regular files.  This is
> because inline data is stored in the inode block, outside the regular
> bio-based data path where fscrypt and blk-crypto normally operate.
> As a result, devices that enable blk-crypto for encrypted file contents
> cannot use F2FS inline data for encrypted regular files, which wastes
> space for small files.
> 
> This series adds support for keeping small encrypted regular-file
> contents as inline data.  The f2fs side defines a new on-disk feature,
> encrypted_inline_data, under which inline payloads of encrypted regular
> files are interpreted as ciphertext.  The payload is encrypted before
> being stored in the inode block and decrypted back into page-cache
> plaintext on read.
> 
> The fscrypt side prepares a software contents-key transform even when
> normal file contents use blk-crypto, so filesystems can encrypt
> filesystem-managed data regions that do not go through bio submission.
> The new fscrypt helper operates on fscrypt data units and leaves the
> filesystem responsible for deciding which filesystem-managed byte ranges
> need this treatment.
> 
> The software crypto operation is limited to the inline payload.  Since
> these files are small enough to remain inline, the expected read/write
> performance difference between hardware and software crypto is small,
> while the space saving from keeping the data inline is significant.
> 
> The feature is guarded by CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA and by the
> F2FS encrypted_inline_data on-disk feature bit.  Filesystems with this
> feature set are rejected if the kernel lacks the config option.
> 
> Hardware-wrapped keys are not supported by this initial version. I would
> like to discuss whether this feature should remain disabled for
> hardware-wrapped keys, or whether there is an acceptable way to support the
> combination in the future.
> 
> The f2fs-tools support for formatting filesystems with this feature will be
> submitted separately.
> 
> Basic testing passed.  Encrypted small files can be kept as inline data,
> and read/write verification succeeded.

Honestly, I'm not convinced this is worth the complexity and the
additional memory use.

First, it works only in the combination: 'f2fs && inlinecrypt &&
!hw_wrapped_keys'.  That really limits how many users would use this.
'f2fs && inlinecrypt' de facto targets it to Android devices rather than
"regular" Linux systems.  But at the same time, the "best practice" on
such devices is to use HW-wrapped keys, which has already been widely
adopted.  So this would be useful only on devices where the SoC doesn't
support HW-wrapped keys.  Its usefulness will go away when support for
HW-wrapped keys is added.

Second, in the per-file key case this makes every file use an additional
1 KiB of memory or so (assuming AES-XTS) to hold the "software key",
just in case the file ever has inline data.  That seems problematic, and
maybe not a great direction to be going in right now, given the ongoing
RAM shortage.

There also seem to be quite a few bugs/issues.  Sashiko found quite a
few
(https://sashiko.dev/#/message/20260513100431.299904-1-liaoyuanhong%40vivo.com).
But just from a quick readthrough, anything that calls
fscrypt_is_key_prepared() seems to be broken now, as that function isn't
aware that both fields of fscrypt_prepared_key can be needed.

I'm also not seeing what differentiates the new
fscrypt_{en,decrypt}_data_unit_inplace() from the existing
fscrypt_{en,decrypt}_block_inplace().  They seem redundant.

There's already a lot of complexity in fscrypt, with the different
settings and the different ways the filesystems do en/decryption.  With
this, plus the concurrent work to add support for extent-based
encryption (for btrfs), it's really quite hard to keep track of
everything.  So I have to wonder if this patchset is really worth it.

So, overall, I think this would need a bit more work.  But also I'm
wondering if it's actually worthwhile.  Do you plan to never enable
HW-wrapped keys, for example?  And you're fine with using more RAM?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
