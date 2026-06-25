Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id orOYJ3HSPGpgswgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 09:02:09 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062C6C331C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 09:02:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=bTSV+q7S;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=FvcinvP6;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="TG2/MXWJ";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=dyUeAerz;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-Id:Date:References:In-Reply-To:To:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF6LhTBn37EwVKkt937tWBln/2oUbfFtCC2cGxHZ+nQ=; b=bTSV+q7SwXXK93vu0OYPSZCpvq
	PJ6lFDt+oDxjaIUg70VxyVVQkSovZje+kZTtnUKV+9HfpSTq3WeTvaTvJPsf7npFVQThgDUZFwXH4
	4NcLfsgRMsyin5IZztJ5FOXh7NNzTIaOcO1qP0TtPCb6cl3fPGjzFmOi78vMVritPCtU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wce60-0006gd-DH;
	Thu, 25 Jun 2026 07:01:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1wce5z-0006gW-G0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 07:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:References:In-Reply-To:Cc:To:From:
 Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+vv8SM8eUAW3MCRiYBMwLSNBJkmkWiJDn52oy/sEKaQ=; b=FvcinvP6rrvsfa8bCgPt7xP+/d
 G1bcY/1MMfx8rNHJS32h5sZCLuoBRI8SkCRVS1NlMsQ0ClBqlIyVwARbpkEXQK0QVoBbZOikNv3lm
 Kt3/6TonMzdkgmpPkah6IZcBEOsh2IMdidW+SqVHJWkXSAo0d1SrCgQuLJgPrcKgu4eg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-Id:Date:References:In-Reply-To:Cc:To:From:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+vv8SM8eUAW3MCRiYBMwLSNBJkmkWiJDn52oy/sEKaQ=; b=TG2/MXWJf64a2NcRHtd7+Mbdtk
 T7wv7n3aIVwcG42SYAewaUojb982XdaqeK/7Rhq733Gm9rklF6OB8aY3Wlf8ji+gHDLroQROkFo78
 MC/BtuDtp4PeGFvmZKAIP2CcbGT8uhr82rM9JU1ddO7y8FeAUVP8dwHstHRLV/21DjM0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wce5u-0003Hg-TD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 07:01:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A90A460217;
 Thu, 25 Jun 2026 07:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D3B1F000E9;
 Thu, 25 Jun 2026 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782370900;
 bh=+vv8SM8eUAW3MCRiYBMwLSNBJkmkWiJDn52oy/sEKaQ=;
 h=Subject:From:To:Cc:In-Reply-To:References:Date;
 b=dyUeAerzru3xhnFxtZ+CbG65FbUdOu0DgT1EdRs+Fh5nbuoTM0kZGTsrCHmZQSZ4E
 Mf5hx1nT9BoSHOfwF5eNt2DzQ3l9GYvzQ+EKyJCGerpBchHmAvSWAa2xGHkpYwr4b/
 3hGROIWH8dacrQ6f1LjyWDrVJ282Abav4LvIsn2rE0M9dHbgE0+UL+0uZBiX9FwjKB
 oMdDPuJmhgHW6m8NbHBaRyBePCbnPFCqeepO/XS4wAsPQmL0T63OcZE6Q5ZaWn/S+X
 uTBN9FKvdAcDTNbMASr+WpgrqFu6Da33TiS0cOOmJRUc9GfArmLx4HXm/ui2R3RWwp
 yzJYU8tTtQNnA==
MIME-Version: 1.0
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20260624050334.124606-11-ebiggers@kernel.org>
References: <20260624050334.124606-1-ebiggers@kernel.org>
 <20260624050334.124606-11-ebiggers@kernel.org>
Date: Thu, 25 Jun 2026 09:01:34 +0200
Message-Id: <20260625-kniefall-gemauert-strategisch-f4ad784de60d@brauner>
X-Mailer: b4 0.16-dev-d9d01
X-Developer-Signature: v=1; a=openpgp-sha256; l=381; i=brauner@kernel.org;
 h=from:subject:message-id; bh=o7y3zrWWLolQ8rjHQUEvtkfJrU1SIgeSJi1z7iC+nrk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTZXArIvNXXXfhZxvBow6k26TVNu3SOVMs/nWLSIni5J
 mSRaMXajlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIn8CGT4ZzTD+2Fi1YtLfesm
 c3BFrgviP92eJvfK9aaOhcbLOkl3Fob/rhOf+5125WLY2tO6Q+q5pbTe9sLkpgtL/h5U6f9/paC
 OBQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-06-23 22:03 -0700, Eric Biggers wrote: > Now that
 fscrypt's file contents en/decryption is always implemented > using blk-crypto
 when the filesystem is block-based, the fs-layer > decryption c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wce5u-0003Hg-TD
Subject: Re: [f2fs-dev] [PATCH 10/16] fs/buffer: Remove fs-layer decryption
 code
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:riteshlist@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[brauner@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2062C6C331C

On 2026-06-23 22:03 -0700, Eric Biggers wrote:
> Now that fscrypt's file contents en/decryption is always implemented
> using blk-crypto when the filesystem is block-based, the fs-layer
> decryption code in fs/buffer.c is unused code.  Remove it.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---

Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
