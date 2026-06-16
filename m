Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1G4aOQvWMWrPqwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 01:02:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84791695AA1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 01:02:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=WghJasIO;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=S1JFvIq0;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=WtpdqsZT;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=UiXgzW7o;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yl43H7uxnWR34rUcmYCNibVYy1PZxKkeDr9ECl/uxTY=; b=WghJasIO4OQbyQ+a0Fjb9MEbVk
	cvkMu/9D4q5ffkDxd5UV8LHuQek+/hpOIdNcQ2CLf2C67NP1IoXzC0i8CxHn9HewgGfSnnFL+21U+
	kn9XqWDiqcOzXhjf14iKBo6lj/1qq5IfeI9E5LnjJ9LlzLzW66e2UmJd4fc2mSyfmGOI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZcnX-0003kc-S7;
	Tue, 16 Jun 2026 23:02:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wZcnW-0003kR-SO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 23:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ALycoJqF47JiSW3q3qosjWMWmgc4Rn8LlDIDcPMChlY=; b=S1JFvIq0+xGIAcJrJZj0zsQLXe
 MphAU9TAXgfZzhvKVv2JV8t6AIXtGVGb4amAe2dujTK3fz9sy7OHCNH3k1taRSjxjNVRzAvrWXxf9
 2tmJ+LJvES8U/4vxNNHVz0Ckm4UOx7Peu0IQ7K6RZJrwDB+k593vYJeVt/r3JfToQcPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ALycoJqF47JiSW3q3qosjWMWmgc4Rn8LlDIDcPMChlY=; b=WtpdqsZTzXv0pz1mFdudouJkw3
 oUxy+Y8pdKmEfSPBWsFcEF+73hbYBMHNGnDmpaPn6k3GFKPG8skvbAS52TCIDsgtrAqieDt1Z9ITB
 ZX0YkHM95KXlE7xrwdmTqwtuqQEwUnJVja3z+PTkwYJYhNJx7OKpqAsCvhW+MZlVYoKY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZcnW-0005Cs-OE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 23:02:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A527C402A6;
 Tue, 16 Jun 2026 23:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AF71F000E9;
 Tue, 16 Jun 2026 23:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781650937;
 bh=ALycoJqF47JiSW3q3qosjWMWmgc4Rn8LlDIDcPMChlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=UiXgzW7oJNp5oLHQKJ+Gv76OvpIPe8p65skAe0t9XSOL1cp39mb+FBktdJzMe4adZ
 WyeS9jMjNt0JXod4D1pdLs+el05lNXdpqmbq1OaAwdax0uwpGy51feTDK0YxyHMp3+
 xsE5MurJ4YYrePYXaiTgY0ApjU5KX9/Ts1LTERPAOcvKW/Ag8c9aP7MuRf0oPx19DW
 NQpHR2qrvunvGzI/1Vd2XfQl3tI82+QD39dRBxAWNjUFrTjfWUJzpezsx5tzS0Sgoz
 phE0PvPHxbC3DVPDhs699/3Zan6/0cDsBVpJ11iA6lgAFzILlc9I76mTpqOkLtRxh5
 +s+L4S8Nk66TQ==
Date: Tue, 16 Jun 2026 16:02:15 -0700
To: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Message-ID: <20260616230215.GA1873@quark>
References: <20260615193728.GA1764@quark>
 <20260616094612.45505-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260616094612.45505-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 16, 2026 at 05:46:12PM +0800, LiaoYuanhong-vivo
 wrote: > Could you share more about the direction you have in mind for
 simplifying
 > f2fs/ext4 contents encryption around blk-crypto? Currently ext4 and f2fs
 each have two implementations of file contents encryption and decryption:
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZcnW-0005Cs-OE
Subject: Re: [f2fs-dev] [PATCH v3 0/3] f2fs: support encrypted inline data
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
Cc: corbet@lwn.net, tytso@mit.edu, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, skhan@linuxfoundation.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:liaoyuanhong@vivo.com,m:corbet@lwn.net,m:tytso@mit.edu,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:skhan@linuxfoundation.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quark:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84791695AA1

On Tue, Jun 16, 2026 at 05:46:12PM +0800, LiaoYuanhong-vivo wrote:
> Could you share more about the direction you have in mind for simplifying
> f2fs/ext4 contents encryption around blk-crypto?

Currently ext4 and f2fs each have two implementations of file contents
encryption and decryption:

- One where the en/decryption is done in the filesystem layer

- One where the filesystem attaches a bio_crypt_ctx to the bios and the
  en/decryption is done either in the block layer by blk-crypto-fallback
  or by inline encryption hardware

I'd like to drop the first one, for simplicity and to reduce the burden
on ongoing developments like large folio support.

> For f2fs inline_data, there is still a real space-saving benefit on phones,
> since many encrypted files are smaller than 4K. Is there any acceptable
> future direction to support this kind of inode-resident data with
> blk-crypto or hardware-wrapped keys?

It is incompatible with inline encryption hardware.  A CPU-based
solution like Intel Key Locker or RISC-V High Assurance Cryptography
could provide similar security properties.  But there's nothing for
arm64 yet.  And I should mention that no one has wanted to use Key
Locker anyway because it's really slow.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
