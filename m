Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 053EBF85F2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Nov 2019 02:21:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUKrf-0006t1-Qw; Tue, 12 Nov 2019 01:21:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1iUKre-0006sq-Ci
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 01:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lt7kkzcvr2Zm1WF2FX3Ksi0MjcHQEjcfJJDJewsWcYI=; b=AfjfS0kZBOW9hkEh+a5VQ2C3Ff
 PRkxHRB8ZjRox2CCFqMwDJVSwk+RrR+JZm2WTwNSOEetsMh/GCVpnB6rk54Cakqbma+B02MqVyQ0x
 NxcjMnNsYCe68n7rWRqWcdaXpGN7UX1R/cAnDsUxpT2EIUi8c1n0hevS+i1WffW7w5j0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lt7kkzcvr2Zm1WF2FX3Ksi0MjcHQEjcfJJDJewsWcYI=; b=e09fMzfeWv8Bqe3yUHPOG731GP
 1EjCZ3pOI+Z+nhAygwqb6c/HUBLND3dHjG7u579Ns6t01D5j2E/VPdieSITiWGhRxd4NXZ6C9G1cD
 +/26/FaQwecT8ObTbOHKvFl/QU+iWF6Rdnju5blRr3kgp+R5VmXCIkpVNHTBf5g0qYmw=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUKrd-00CnAn-52
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 01:21:02 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAC1JTn4192249;
 Tue, 12 Nov 2019 01:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=lt7kkzcvr2Zm1WF2FX3Ksi0MjcHQEjcfJJDJewsWcYI=;
 b=lfF3K+xvXBRLhyzLBdNEzLgWiDXdCo5FUt/15WHATTk/4qf5I+/lhhYXKuGLEkm9B1PN
 3pZvv5XkvrJ5z0yII2YehD4yLk0tXPyazpdHM4+j61lIlFKLp8v7x+mbpFxpIr5viMkQ
 B2l/HId1bpd27on/Eo643KO3VuuW2JP2kaA9OuvvaXgBCkJYQIjwD/+wFAOgaSxbLzQy
 lVgd5ejB+QAgki41orPc8rKFs9FcFHmylS/jI44E1P95vRpGDFWmSTfPZIzBXn8S7ovZ
 vNTi8KShws8rLkwXpFU/AvWqJRkU6b7kbQOmZ1Q+6zIy0xospzde6AalavXAP0YjvDzE yA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2w5ndq1jmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 01:20:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAC1JTJM180457;
 Tue, 12 Nov 2019 01:20:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2w67kmu553-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 01:20:42 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAC1KdN4027423;
 Tue, 12 Nov 2019 01:20:39 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 11 Nov 2019 17:20:39 -0800
Date: Mon, 11 Nov 2019 17:20:37 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: ira.weiny@intel.com
Message-ID: <20191112012037.GU6219@magnolia>
References: <20191112003452.4756-1-ira.weiny@intel.com>
 <20191112003452.4756-2-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112003452.4756-2-ira.weiny@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911120009
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911120009
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1iUKrd-00CnAn-52
Subject: Re: [f2fs-dev] [PATCH 1/2] fs: Clean up mapping variable
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

On Mon, Nov 11, 2019 at 04:34:51PM -0800, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The mapping variable is not directly used in these functions.  Just
> remove the additional variable.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
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

For the iomap part,

Acked-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

>  	loff_t pos = 0;
>  	loff_t len = ALIGN_DOWN(i_size_read(inode), PAGE_SIZE);
>  	loff_t ret;
> -- 
> 2.20.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
