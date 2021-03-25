Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4973494F3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 16:09:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPRbp-0003R6-Av; Thu, 25 Mar 2021 15:09:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1lPRbn-0003Qp-Kv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 15:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oWSLp3kztJr4m5/1tikMbEw6FHyHlIYtntDmWxUuIP8=; b=Y5s4Ga1Dfews0CbMzubOY5+dCk
 oWiQx11E5ZKot5dXLOdl9oSpgU3x+KMlsNFrZ4YjPXiT6hugB//3lB8LT6PZypjTjDeX/e98sFFRU
 HnR536/xjizrjJEq4bTMBEjGS3zI0StMDRICw5Ull5FeEffjYYlAhfoontMhxPNML/xo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oWSLp3kztJr4m5/1tikMbEw6FHyHlIYtntDmWxUuIP8=; b=D1ArAcOYbo9aQDmp5yRvrh58WH
 scn1m2nTHxmSS/2tJsLr4nJgGt3YCNgqWGvs1vYYdnW4NH5t8O7laatuzUQ0vM4CfVjxvB0Z0zR5/
 WxhGSzsadeWeiwu4AdujM4VycIL+FjirSZLecsIT/kEyZq/3H8cTE+JOH9AmSgCRheqk=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lPRbl-00ADuH-Af
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 15:09:15 +0000
IronPort-SDR: 1Hf4RdQVbq8pXp4YFRdtTkSPu86uZrMCqZHdNKnt0v34C+aCGnPBWgBf2EOkkKnMR/QjywdDcs
 O5NBdl7X/eZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="187645243"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="187645243"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 08:09:07 -0700
IronPort-SDR: TdFsjK737sdvRzKo9OH8ApPIwJ7KYIKIbkmYaGTUalxVWLiB6dkDFjbzKYBEMfEIALjFk7Wsxm
 fC9V5/CgJMew==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="409406687"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 08:09:07 -0700
Date: Thu, 25 Mar 2021 08:09:06 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20210325150906.GW3014244@iweiny-DESK2.sc.intel.com>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
 <20210207190425.38107-7-chaitanya.kulkarni@wdc.com>
 <YFycvk4aMoPAZcwJ@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFycvk4aMoPAZcwJ@mit.edu>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lPRbl-00ADuH-Af
Subject: Re: [f2fs-dev] [RFC PATCH 6/8] ext4: use memcpy_to_page() in
 pagecache_write()
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
Cc: axboe@kernel.dk, ebiggers@kernel.org, damien.lemoal@wdc.com,
 bvanassche@acm.org, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 hch@infradead.org, johannes.thumshirn@wdc.com, dave.hansen@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 clm@fb.com, adilger.kernel@dilger.ca, dongli.zhang@oracle.com,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dsterba@suse.com,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 25, 2021 at 10:22:54AM -0400, Theodore Y. Ts'o wrote:
> On Sun, Feb 07, 2021 at 11:04:23AM -0800, Chaitanya Kulkarni wrote:
> > Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> > ---
> >  fs/ext4/verity.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> Hi, were you expecting to have file system maintainers take these
> patches into their own trees?  The ext4 patches look good, and unless
> you have any objections, I can take them through the ext4 tree.

I think going through the ext4 tree would be fine.

However, there was a fix needed in patch 2/8.  Chaitanya was a V1 sent?

Ira


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
