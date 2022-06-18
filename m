Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E0550786
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 01:42:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2i4u-00047p-Kg; Sat, 18 Jun 2022 23:42:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2i4s-00047c-UK
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jun 2022 23:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OHhnlZYX86ot/5yda9j16mb830Uvyhri9sG8r/kC+M8=; b=Q6ceTQXIslfPkalQhUh7zLIPy0
 os7217HcPvp05gR9NBYh3aU1y5OuQJmhG+kEX3ia2lN6m90ALFs3oxf1TE1VqzvL70nHKCGyw/5IJ
 ICguq9GrxnghW5M0Gxi1wLu+wYA6a046vQmfpxNlu63GTiCUMid6CyGia3XLy8yj2kOw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OHhnlZYX86ot/5yda9j16mb830Uvyhri9sG8r/kC+M8=; b=b2LQGzwLf8waW05YE+/QQtLJ97
 cxfhyeRP/pB8OSduJpjxVBmWo3yULh7QCQkJkbDCYBIIvBbXGSUNdxo4ptG0attTz1gBWWLJf0O5c
 j1wdrFIG6aVi97HOjuFlsGnX5PfQo29Zx4p9rupucxBZE5PO03sgMOiHcmkiViGlFkZk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2i4s-006ns8-AK
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jun 2022 23:42:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0DCF0B801B9;
 Sat, 18 Jun 2022 23:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EE8C3411A;
 Sat, 18 Jun 2022 23:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655595718;
 bh=eGeODo9RuB/uorVOiVof5WaaG6KTW6kNJBvVdGYXHL8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bfKY2ZseRnS/mg7G+cJCsvniGXIIOM2Zq7xbY21mF3luDUarfq6cSA5roh68whljr
 Y2aDQSahO/dsFJSAvNjGlAp7UfXIUVTSHUSglmm7DsHOc6ZL6+6utFlUEooLjHq3sX
 VC6y8mSdsg62tJOjmfrJtSrpGEVfJhbky4S5PpNTC2/Os19X9SYTXZv/0KH7Q7Ub1x
 752GcVOrXTErs+lTWzxA+68jyG72fbkg0MimJA3YyZ/XYu83PyqI2MAGaELyZU8MDb
 /W6nl96IcGzUdSqiHAA3EOuz28CvDo1VAvfu3pMNWpqCG+HElUPDeDltoZrhJQ3YF+
 cyL6wj/kb1IfA==
Message-ID: <01f36870-1978-b4d6-559e-edce78d06e00@kernel.org>
Date: Sun, 19 Jun 2022 07:41:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220614231724.776264-1-bvanassche@acm.org>
 <20220614231724.776264-3-bvanassche@acm.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220614231724.776264-3-bvanassche@acm.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/15 7:17, Bart Van Assche wrote: > The definition
 of struct blk_zone_report is as follows: > > struct blk_zone_report { > __u64
 sector; > __u32 nr_zones; > __u32 flags; > struct blk_zone zone [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2i4s-006ns8-AK
Subject: Re: [f2fs-dev] [PATCH 2/3] Fix f2fs_report_zone()
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
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/15 7:17, Bart Van Assche wrote:
> The definition of struct blk_zone_report is as follows:
> 
> 	struct blk_zone_report {
> 		__u64		sector;
> 		__u32		nr_zones;
> 		__u32		flags;
> 		struct blk_zone zones[0];
> 	};
> 
> Since f2fs_report_zone() allocates the above data structure with
> malloc() and since f2fs_report_zone() only initializes the sector and
> nr_zones members, the flags member is not initialized. Modify
> f2fs_report_zone() such that 0 is passed as flags to the
> BLKREPORTZONE ioctl instead of a random value. This has been
> discovered by reading the source code.
> 
> Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Fixes: 6d7c7b785feb ("libf2fs_zoned: Introduce f2fs_report_zone() helper function")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
