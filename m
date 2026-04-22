Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPY6IM5Z6WndXwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 01:29:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7544B8A7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 01:29:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9QzNyEk5l5tO1PgfHITWLw8ftN+i+/VokEgGnZUAqc=; b=CGioCYJjqLdSRZD+NKDJsgYl5w
	ZMvSpKxjgxiQ8ZwaVgeZBMdxyGpURnIiGeOJjJZxb0gkAKI+6PhA2vuVESLIqapOcM3zQfp+MbxFn
	H3EDeAQBmDhFM6PjcEjwbzNOCJZ4jkJA4VuX4SRQCM3HbnUt3Z2+X0Wg9s/9H2dbDub8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFh0I-00013c-8I;
	Wed, 22 Apr 2026 23:29:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wFh0H-00013T-5H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 23:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6wFPiIH5ex67Fst4LcSGjEjPi/jgihMu71AWUJnOCtA=; b=Ha9CziZKuGlGST5nptfX893IcO
 NDchD6x7jy220lC9aEWd9DAb/D27GELDvgfSNeg2laMEZGuhY11GZmbAmAjuH6IiDhknLMerC+yau
 kAh6RozvYgks8anUu04GeNIVXl3tdzSVuMxOrNqEhA7hKrvD1w5/DPm8fN3JfZUowv+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6wFPiIH5ex67Fst4LcSGjEjPi/jgihMu71AWUJnOCtA=; b=P/dnJWoBW5psoQ9Fz/QyjFL/vC
 aTr0zY8vW5n/o635K4xDz18Rkp0GHjAuP1ZsDDRz9kimEsw386f8kiWup5IhXZTUuWnHQisBR1Oje
 HujkZERj39tqAmm20PI4TfSKxEzu4RbUSg9GWoOcJbGMw507DEo0fN9nUc+2DMrgx1Q4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFh0G-0006Y5-LG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 23:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5081540E56;
 Wed, 22 Apr 2026 23:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC915C19425;
 Wed, 22 Apr 2026 23:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776900543;
 bh=bvl92UEOxoPlURu3laZ0+Grpbq+E+dKoVy+MV3iNcMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SekkEjDhHV8mJkGXxThm7jzjXl5r+G21rFwehhvUlC8Rt0thUJXkQ9ZvnLJDA49bN
 AiEWsPZKrWpwJl6zfPjMan6ZQQZ0SAX+GPqfqhIpTcP35W8c1hY1j5dB6ZIVRdWyZA
 RNZviU5piCS25/nr/hQI6ts3ddvXVIovvSSX1VqyN4YbVGTBHe3cWBWDtY95rWDwN0
 xHHWA5ihxTGxv+YwxpMRqQ876Ka0u7IW76BymiTC5SP9o3smEjBbRycPC8NcfOLvHb
 0Z8M9tfGW58T0LF6vlXrNkCURDjmm/8i26jOGnEaqiBhh7H6sdLRr3wu5y+atVFtu1
 3x/J7bLZeZD7Q==
Date: Wed, 22 Apr 2026 16:27:47 -0700
To: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Message-ID: <20260422232747.GD2226@sol>
References: <20260421075717.170840-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260421075717.170840-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 21, 2026 at 03:57:17PM +0800, LiaoYuanhong-vivo
 wrote: > Some filesystems store small file contents in filesystem-managed
 regions > rather than in regular data blocks submitted through bio [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFh0G-0006Y5-LG
Subject: Re: [f2fs-dev] [PATCH] fscrypt: add software key support for
 filesystem-managed data
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
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:liaoyuanhong@vivo.com,m:tytso@mit.edu,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: B0F7544B8A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 03:57:17PM +0800, LiaoYuanhong-vivo wrote:
> Some filesystems store small file contents in filesystem-managed regions
> rather than in regular data blocks submitted through bios. One example is
> F2FS inline_data, where the payload is stored inside the inode node block.
> Such regions still need to follow the inode's fscrypt contents encryption
> semantics, but they cannot rely on blk-crypto because they are not
> submitted as standalone file data bios.
> 
> As a result, when blk-crypto is enabled, mechanisms such as inline_data are
> typically disabled outright. However, it is desirable to re-enable such
> space-saving features while still preserving the required encryption
> semantics.
> 
> To support this, add fscrypt_crypt_fs_layer_page_inplace(), a helper that
> encrypts or decrypts a caller-provided page region in place using
> filesystem-layer software crypto and the inode's contents encryption
> policy.
> 
> This support is limited to v2 encryption policies. v1 policies do not
> provide the key setup model used here, so this path returns -EOPNOTSUPP for
> v1. Hardware-wrapped keys are not supported either, since deriving a
> software skcipher key requires software-accessible key material, which
> conflicts with the hardware-wrapped key model.
> 
> When the inode's normal contents path uses blk-crypto, fscrypt may not have
> a software skcipher key prepared for the inode contents key. Add an
> optional filesystem-layer prepared key to fscrypt_inode_info. This key is
> derived using the same v2 contents-encryption KDF as the normal contents
> key, but is prepared as a software skcipher key and is used only by the new
> filesystem-layer helper.
> 
> Signed-off-by: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>

I don't have time for a super detailed review at the moment, but here
are my initial thoughts:

- This needs to be sent along with the code that actually uses it in
  ext4 and f2fs.  Please also Cc the mailing lists for those
  filesystems.

- This is going to require an "incompat" filesystem feature flag.  After
  all, once a filesystem contains files that use this scheme, older
  kernels won't understand it.

- UBIFS and CephFS already use fs/crypto/ but don't support blk-crypto
  (inline encryption).  This new code feels duplicative of that.  It
  should be possible to reuse the existing code instead.  That would
  include, for example, reusing the existing en/decryption functions and
  the existing struct ci_enc_key field.  This would keep the changes
  limited mainly to how the key is being set up.

- Supporting all the different IV generation methods doesn't make sense
  when a per-file key is always used.

- The fact that this is incompatible with hardware-wrapped keys greatly
  limits the usefulness of this.  (Note that technically, it could be
  supported in combination with them anyway.  But the security models
  would be inconsistent, which I assume is what you have in mind.)

Hope this is helpful,

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
