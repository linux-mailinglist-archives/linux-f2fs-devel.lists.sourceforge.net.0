Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 046CD4D0FC3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Mar 2022 07:06:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRSzd-0007dt-IW; Tue, 08 Mar 2022 06:06:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hch@lst.de>) id 1nRSzb-0007dn-Up
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Mar 2022 06:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dzvXEI3iJ0TDWzxBaIAfvr1cScE+N/Ca+dxddMekoAI=; b=gIT/7DDZNhtLihJaquqnWrwLf2
 Sc4A2ekuXhavEXHkDfJFbb7aCW8QsAfEkc6sjv9+fq5kZzvChvAn+1ntZVLrC5gR2z1KNJBpNpNsi
 TLrf+Bfstzp0n44hL8+GpXyfx/oP1q0tONakBf2WiUwb9/J54O9QCrujBIcu4mXQMW0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dzvXEI3iJ0TDWzxBaIAfvr1cScE+N/Ca+dxddMekoAI=; b=WGOgQe7CNl7UxbAsGg9E+cG55Z
 VVXq+AC5GaRxa4s+rGNaFZp0/vtnlB+jd6CI7Dv1jmtqii+KqYOfVrEUHxtVauzb63GoFNjMXij0R
 Ps5mhp3IzW0PwvUOl/j+c3Jjod+9h8NuWuHgwbJBQo15FfDLdCRNJ+mchpMnguyYXyJc=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRSzZ-008C5I-9a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Mar 2022 06:06:42 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2339068AFE; Tue,  8 Mar 2022 07:06:25 +0100 (CET)
Date: Tue, 8 Mar 2022 07:06:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chao Yu <chao@kernel.org>
Message-ID: <20220308060624.GA23629@lst.de>
References: <20220228124123.856027-1-hch@lst.de>
 <20220228124123.856027-3-hch@lst.de>
 <782226e0-5e7a-aec8-b9aa-e7fd7b3110a7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <782226e0-5e7a-aec8-b9aa-e7fd7b3110a7@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 01, 2022 at 10:49:06AM +0800, Chao Yu wrote: >
 On 2022/2/28 20:41, Christoph Hellwig wrote: >> Refactor block I/O code so
 that the bio operation and known flags are set >> at bio allocatio [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nRSzZ-008C5I-9a
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: pass the bio operation to
 bio_alloc_bioset
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
Cc: Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 01, 2022 at 10:49:06AM +0800, Chao Yu wrote:
> On 2022/2/28 20:41, Christoph Hellwig wrote:
>> Refactor block I/O code so that the bio operation and known flags are set
>> at bio allocation time.  Only the later updated flags are updated on the
>> fly.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> Reviewed-by: Chao Yu <chao@kernel.org>

Is it okay for Jens to pick these two patches up in the
https://git.kernel.dk/cgit/linux-block/log/?h=for-5.18/alloc-cleanups
branch?

>
> Thanks,
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
