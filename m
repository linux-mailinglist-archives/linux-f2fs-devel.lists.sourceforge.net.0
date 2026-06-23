Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gzp5FEP/OWqCzwcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 05:36:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B16B3D8A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 05:36:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=fhlOHYiM;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Fs2QbJ9P;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Ae2J82Bc;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=BfEzP9bx;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWsikcCWNAv2IpYMfYBNpLzOmeWVak71NmqyfZDbYOs=; b=fhlOHYiM2htiRK84Ci9UkGVYB3
	AO5c7j5Uvvx2pJA+FhiVU4PPyYm/1JG9Dq5NksJLESnfk3SZkFMbNixV/eHz1AcBN1+vLJXEAFIwh
	G4UbOk0Oa8rt/9waQILgzyL8zS+mmS8KyZj19UCQrpM5pikFNeu01DNnOJWML8sH9sIA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbrvu-0007bJ-V7;
	Tue, 23 Jun 2026 03:36:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wbrvt-0007b6-G8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 03:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCHnYlVG/7Jpw4FnCw+I3RtmJBZIoCupuIHtQ+K/tRM=; b=Fs2QbJ9PW1JzfaWJVpo1Bp9T7j
 A30SE48W0JUyN66I6Dh/36rlKEyV+tVjvlKllzSedKxWH8YHmJkB1VYo7pkpnvSrEpgafEWHCTSz4
 f+6YNiDRVflA0yyLl9wSXpwDkCKLh7cH5nTeG18qetyHaUicW44AbhwkWd168PrnG9Sc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JCHnYlVG/7Jpw4FnCw+I3RtmJBZIoCupuIHtQ+K/tRM=; b=Ae2J82BcnePKdmdO21jSjwU+NI
 UZTtTHKrai8uCW21lp20Ulbxj+JAbKPgSUGIaJz38BkCmvnw7DDavJbXTuLmyETXIUUWJl8PcaYQt
 EzDsrcCQCNGj5/48jnNwbz58PmefZlpXKNSYzsWX2McxEZrg4u+wuhX5YsFL7vC4tR2c=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbrvr-00068O-ON for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 03:36:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 89DEF601F3;
 Tue, 23 Jun 2026 03:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521711F000E9;
 Tue, 23 Jun 2026 03:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782185770;
 bh=JCHnYlVG/7Jpw4FnCw+I3RtmJBZIoCupuIHtQ+K/tRM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=BfEzP9bxaBgtkygivmG4fZ/hpmS5W9t+QMtTkhyDKDpQSAXEF+MYYFU0+tH40l2lX
 ae8YPQ95kjSd2SdF7R7dpBlGvxgFFAw3x4YOwSA5Iscow+AC0MsMIXPfrnAifKwNR3
 EAPf/Bmk6HGyjnPYKdNh4DzL3KG1kzeOh90EA994cBmeX01yCz1dYPhCRRW1wyDxog
 L6VXhgburdJ4lukbnjR4IKZtF3ghIjS5HPLjTbkGnDVVQu+aQLdTpjiC0U4fAqrQ3Q
 nyVLuhwfgOTyCk2yJEW/J4L2trehmhasAI0wjdiRYHTdMmDRrl00ptAs6R8bwyV+BW
 Qx/Q61S0P6yBw==
Message-ID: <e0b1476a-6b51-465d-bdbf-29c37f63ceb8@kernel.org>
Date: Tue, 23 Jun 2026 11:36:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260623032701.173516-1-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20260623032701.173516-1-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/23/26 11:27, Joanne Chang wrote: > Xfstests generic/547
 sometimes fail with mismatched directory metadata > before and after a power
 failure. This happens because when a directory > entry is adde [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wbrvr-00068O-ON
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: dirty directory inodes on
 mtime/ctime update
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:joannechien@google.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D22B16B3D8A

On 6/23/26 11:27, Joanne Chang wrote:
> Xfstests generic/547 sometimes fail with mismatched directory metadata
> before and after a power failure. This happens because when a directory
> entry is added, renamed, or deleted, its mtime and ctime are updated and
> the inode is marked dirty via
> f2fs_mark_inode_dirty_sync(dir, sync=false). The sync=false flag means
> the dirty inode is not added to the global DIRTY_META list. Therefore,
> subsequent checkpoints skip flushing these updated directory blocks,
> causing directory timestamps to revert to stale values after a sudden
> power failure.
> 
> Address this by changing the dirtying parameter to sync=true during
> directory entry mutations and renames. This forces F2FS to immediately
> queue the updated directory blocks on the global DIRTY_META list,
> ensuring timestamps are committed to checkpoints.
> 

Needs a Fixes line and Cc stable.

> Signed-off-by: Joanne Chang <joannechien@google.com>

Anyway the code part looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
