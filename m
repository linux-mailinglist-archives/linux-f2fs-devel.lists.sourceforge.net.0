Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C9CDE33F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 02:42:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+7m+EhBbdeW437o4KVG3wAeSwJ0VoQ8jMAgvmuyRJc=; b=KSX8jgBnjzkFhDJbzpFW7M0QPI
	Z3c7AUskvv246/AYw+8tKA3y75br4PASPZRQYc9zYB5oMZbNoutCI8NosCBFsDon5py9Tmvg0KQje
	bcjuC2niacVA7WeIVPV9H4/ssZJnYEtMpChRM3UGzzqR2TYE8RT3K7oWXX5h6d8r7bew=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYwqZ-0004rs-Fh;
	Fri, 26 Dec 2025 01:42:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vYwqY-0004rm-3K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 01:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AkyLlyND3hO/0/mTA7VI1BkMmVFcyucSjrkX1itWqjQ=; b=avfkPkIQ5iVbF5ERs6j5pu3+RE
 zfiLE0CXMx54oL71t81oSVORWrH4CQLv6NwSWB6KiEOg4wdRgOSl28y7RsfvgG5TnqkEOLiW1Pjk/
 CPMK3VZxhVWQHgBE9GUt4W6E/Z6EJby9XFjJgxR41ca93X+sFjGOmBF7dumI4hGPaefA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AkyLlyND3hO/0/mTA7VI1BkMmVFcyucSjrkX1itWqjQ=; b=MBWbmyGhREH5TRlaOZMihM7XTc
 VW3O8uQya13S16JZDJBeivndN/cNKAX8dtD2BEkDm/PUc715dOhLxQ1PhoIL7kdqOBb63wju8QNZO
 3hNEdsYQyrEwypGuF8GprefBO6kaP3VUO7nB30xyVuAhtsV9cPepYKG2s9ipZgorO1so=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vYwqX-00047R-HB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 01:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D0C476000A;
 Fri, 26 Dec 2025 01:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4BDC4CEF1;
 Fri, 26 Dec 2025 01:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766713334;
 bh=7YQOqVBoyjgBMvV490k9k30JN/HJfmY647JudY1WlZM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=oem8J/0v1Oz8uxjYJJ5nENCMQhgGycS2MXNyF74gOfI0dHmpQo873BO2IOJPNY2D4
 BgCSqrHdy4xOD/3IViVLfOEjHCVx6c42ODspeqZSkChI5mX9YhHdIG77qQkS31GsW8
 EDBjp4g+CzeAp9T0sPBlPxWVrTN09C9w8/5u3NhtYf00OkkzKsjCWRqM3Misz9qfSK
 JIGmy9AskMT+bqiSI9nShMjewr0H8esyrrbFVGB2CvhmPS+3fniDFBUfnACAnRP9Nc
 vFDyH/GQ3Yt6+68MLLvGm23Wy5w22Vci74NP/ZYxYnOYspU5m3gZ+Fr3clraOkQR2x
 VV7Vj5RgGAEMQ==
Message-ID: <6f34a1bd-705b-4f99-bd34-5a0781c84c2b@kernel.org>
Date: Fri, 26 Dec 2025 09:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20251223144607.1473230-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251223144607.1473230-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/23/2025 10:46 PM,
 Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > The recent increase in the number of Segment
 Summary Area (SSA) entries > from 512 to 2048 was an unintention [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vYwqX-00047R-HB
Subject: Re: [f2fs-dev] [PATCH v6] f2fs-tools: revert summary entry count
 from 2048 to 512 in 16kb block support
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/23/2025 10:46 PM, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The recent increase in the number of Segment Summary Area (SSA) entries
> from 512 to 2048 was an unintentional change in logic of 16kb block
> support. This commit corrects the issue.
> 
> To better utilize the space available from the erroneous 2048-entry
> calculation, we are implementing a solution to share the currently
> unused SSA space with neighboring segments. This enhances overall
> SSA utilization without impacting the established 8MB segment size.
> 
> Fixes: 50fd00b168d7 ("f2fs-tools: Support different block sizes")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
