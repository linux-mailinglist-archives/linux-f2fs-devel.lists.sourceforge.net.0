Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eSbtDjNUKWolVAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 14:10:27 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62C6691A3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 14:10:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=RnMMNysA;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=KQ3p7tIr;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Rsl0NF1c;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="JEdM7/f1";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iV39tnuL+su6zqRatuPFW7gzAcKGMjYCX4WL5RZSIl0=; b=RnMMNysAho5rj/HPBaksK0cseC
	nDw3eQLINLNVAmsk0W/0XAtU2M9dnZO2huuYHQiDd4QUe9pFTsBRouBAZarED4cgTyJkuFoXJJN5m
	2K8wA1lMYzAgXNiaDyazPJl1ltwgRRhc3LdZqz2lf83eUaFhPDvSOeyxwE2O8Hlw2xyM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXHlG-0005NJ-Ps;
	Wed, 10 Jun 2026 12:10:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wXHlB-0005N4-2i
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 12:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/OH5+E8NuGLgpHG3Uwvo6VB+OMw2Wl6vqLZbLuDL42w=; b=KQ3p7tIrzjKGMLaZhJcgSLkFbI
 g81Epzcg3DX0MJRcDycx+rzMOO1OPhlZziTJIMCZcTNl1PbjaXCxWLHwM2EnwqFCgpgYIO8Bax5l9
 6Z53KQRbRfuWxBowqnRp7DNI40Qe6zwrRvFITKS/LryWvrcZvf2a78ynXBHG9ZP6XwRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/OH5+E8NuGLgpHG3Uwvo6VB+OMw2Wl6vqLZbLuDL42w=; b=Rsl0NF1cdj/LkOPWMidx3CZrgO
 pBvLqlEAQ6UE8tE8zm6VORB9b7n13t2LA2QvH3tbtUdsQX45loz/hmCPgrhXEEB4jF0hopEz022Vy
 tIfauyInjrS4ay+XS5hMlTlD8lptdw+zMyilydwT293avn/h8tTvvIf5nzSLtpqr37sA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXHl8-0004Gt-MX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 12:10:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 873346020A;
 Wed, 10 Jun 2026 12:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500C01F00893;
 Wed, 10 Jun 2026 12:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781093409;
 bh=/OH5+E8NuGLgpHG3Uwvo6VB+OMw2Wl6vqLZbLuDL42w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=JEdM7/f1HcT1MidBDZr9/pAdkwRnQXYzNQARCaDL9LLOadmX3bNvKQ2K/+g514pXN
 f9qPjL2qBiwNOclHIGLGm1XoJ0jozTaFRtfCt1rHbBPd5cSMEWzH+am33w7fvqSYb2
 cU0nAN9xSnm51uhAfC6UmmomqAcdOpzJjfjpXoGegQ4QqhIQduxh3btddXWoyRMQPC
 DzHlM25FZJpIZ+dyGfbdjNrF66Ab+1GOhl7cx9hTJ8K2V2FIsM4sQ6DMgTSQH1BGGw
 3xNuAZDQF9jEM6ida0v9y9w8cewJ6slRSs2n5uA/53uDWHf8Enqk2O+ZvdJzIxu78D
 EHzEGZj7fS8NQ==
Message-ID: <326d8403-717d-4479-8ecc-d598de7c9000@kernel.org>
Date: Wed, 10 Jun 2026 20:10:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bart Van Assche <bvanassche@acm.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <cover.1780003055.git.bvanassche@acm.org>
 <60ab44127999ea22ca05aa6c552f305bfaef9898.1780003055.git.bvanassche@acm.org>
Content-Language: en-US
In-Reply-To: <60ab44127999ea22ca05aa6c552f305bfaef9898.1780003055.git.bvanassche@acm.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/29/26 05:20,
 Bart Van Assche wrote: > Use bio frontpadding
 to allocate memory for a work_struct when > allocating a bio. > >
 Signed-off-by:
 Bart Van Assche <bvanassche@acm.org> Reviewed-by: Chao Yu <chao@kernel.org>
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
X-Headers-End: 1wXHl8-0004Gt-MX
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: Prepare for supporting delayed bio
 completion
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
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
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B62C6691A3

On 5/29/26 05:20, Bart Van Assche wrote:
> Use bio frontpadding to allocate memory for a work_struct when
> allocating a bio.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
