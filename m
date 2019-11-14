Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E2FD00A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 22:03:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iVMHH-0006tS-Me; Thu, 14 Nov 2019 21:03:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1iVMHD-0006tF-OI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 21:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dnfYmXtuTFJ/DUGz8VaA60fPJFIOkGVYuPayfZf2++o=; b=YC5uLOZq591RgxDy6+37qrrTyx
 AqpgwpVMhpwj0MPqhx/lhHi4W/kGurl185IUAROm2AXRD/B0CIXT36ZHT8xKJAw8taXfguhv4sAgL
 jSdOOBlqN1qwvSEq0U/0BvQ0RR1g3aRapr3mY9fAfyg46389ZXLbtJYieE+xeGTcKCYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dnfYmXtuTFJ/DUGz8VaA60fPJFIOkGVYuPayfZf2++o=; b=LsWMCgrzI/9975KadLFxPecMWH
 KMvrxPlSwcs+TTMRtvW3pos0yijDX4TCaq8tLk+B/4eGtw5LIruAt/a2UgmzAT4OwPCUA3yWEIRUq
 AMMrjFGAQogahYfS5dyozkKYbi+NtZ1I3ldjyaGbCjetcBaMdYPdvg/TF0Wo7cjHDhN0=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iVMH9-00H24O-3J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 21:03:37 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAEKxF1f037497;
 Thu, 14 Nov 2019 21:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=dnfYmXtuTFJ/DUGz8VaA60fPJFIOkGVYuPayfZf2++o=;
 b=bSs4UdzJaRXd5w6u7NH8KvOryp4qDuqBl2QKOnfFkm8e+GUSzUxMrW5W5ne7/6ajmZcy
 JuPT4eXbme/Hdi0n6qZ3q/oBSozKpcPwSyrlzx5iEsnW3pIZxcmr5+sLSnU78MdEqARA
 BPvkxJxP90K0jm0IWz0kTqFeY1DkZaNz8u2LSQK0kIhMldgKNru7dKPeNSSGeV/bOquf
 jFiW5Cken3iYojwgMF6D8TM4z9dokFr2r8OSFdNywM8T6BZeK/VlG6Nm4YYcoF90vwWZ
 uiz+H4Grq4upRp3EXXcyPRb7+RX+6ege7kvb5zXRgjV4zvMLzd9Ihd6mjsQgU9IFR6jt lw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2w5mvu5tpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Nov 2019 21:02:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAEKsGXS001815;
 Thu, 14 Nov 2019 21:02:47 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2w8g1a1ve1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Nov 2019 21:02:46 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAEL2fo9007838;
 Thu, 14 Nov 2019 21:02:41 GMT
Received: from localhost (/10.145.178.64)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Nov 2019 13:02:41 -0800
Date: Thu, 14 Nov 2019 13:02:39 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: ira.weiny@intel.com
Message-ID: <20191114210239.GH6211@magnolia>
References: <20191113004244.9981-1-ira.weiny@intel.com>
 <20191113004244.9981-2-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113004244.9981-2-ira.weiny@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9441
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911140173
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9441
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911140174
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iVMH9-00H24O-3J
Subject: Re: [f2fs-dev] [PATCH V2 1/2] fs: Clean up mapping variable
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
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 12, 2019 at 04:42:43PM -0800, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The mapping variable is not directly used in these functions.  Just
> remove the additional variable.
> 
> Acked-by: Darrick J. Wong <darrick.wong@oracle.com>

Please upgrade this to:
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
> Changes from V1
> 	Update recipients list
> 
>  fs/f2fs/data.c      | 3 +--
>  fs/iomap/swapfile.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index ba3bcf4c7889..3c7777bfae17 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3146,8 +3146,7 @@ int f2fs_migrate_page(struct address_space *mapping,
>  /* Copied from generic_swapfile_activate() to check any holes */
>  static int check_swap_activate(struct file *swap_file, unsigned int max)
>  {
> -	struct address_space *mapping = swap_file->f_mapping;
> -	struct inode *inode = mapping->host;
> +	struct inode *inode = swap_file->f_mapping->host;
>  	unsigned blocks_per_page;
>  	unsigned long page_no;
>  	unsigned blkbits;
> diff --git a/fs/iomap/swapfile.c b/fs/iomap/swapfile.c
> index a648dbf6991e..80571add0180 100644
> --- a/fs/iomap/swapfile.c
> +++ b/fs/iomap/swapfile.c
> @@ -140,8 +140,7 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  		.sis = sis,
>  		.lowest_ppage = (sector_t)-1ULL,
>  	};
> -	struct address_space *mapping = swap_file->f_mapping;
> -	struct inode *inode = mapping->host;
> +	struct inode *inode = swap_file->f_mapping->host;
>  	loff_t pos = 0;
>  	loff_t len = ALIGN_DOWN(i_size_read(inode), PAGE_SIZE);
>  	loff_t ret;
> -- 
> 2.21.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
