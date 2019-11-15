Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6090DFD1F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Nov 2019 01:29:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iVPUh-0005o0-SS; Fri, 15 Nov 2019 00:29:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1iVPUg-0005nm-Ex
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Nov 2019 00:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9jrL+BhqTPJfGslBLcrIu2gfpEanXTGlkl6dwq3AI5s=; b=YkR2GsazcMnHhBWafXHD6wuFSF
 hTschuXB0moB3IOKtSsCJzMNIfQmVtL+NwKrBKhVIjVuMiyOpA1Al1HkF3m3Cv7kyE3lMqMtfTxg9
 NVLNuGJfVuMkgah9YC1q5wglMDAnwL43SKS4bM2QkWM1OXUXrs7nUgsygiPgH50CV5D8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9jrL+BhqTPJfGslBLcrIu2gfpEanXTGlkl6dwq3AI5s=; b=beEQWZmnWxlWY1rzgarVoE0DI1
 Ia6AU+fuhHYYtUvIcQg1nVPNc+pW20f97jwIJKzhGdUvjjKxdjPCkyZAJ1axbF7n4712juKV+A89G
 hU0/67M4fPeXxAlO4Xfw7HWS13VFx/KiULp8OcaUgZy7oJEDOJmwkG49MTSt1atbWPSQ=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iVPUe-00H5Bz-Hn
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Nov 2019 00:29:46 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAF0NwPc162409;
 Fri, 15 Nov 2019 00:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=9jrL+BhqTPJfGslBLcrIu2gfpEanXTGlkl6dwq3AI5s=;
 b=FAkJB/fkPdwLwF8fI+cc3AEY0b6WrXBX6fm3i4eCPJjFDKMhs8jADyZLQO/WOqP9MRAM
 1U9JW9DSlV6YDhTbTuLGaSSqZfA0y+bkPqmC7PFfqYbGJ9OSGQVczF6uEc9jtvMrwUck
 J5sDuHbVx/0tesYGT2ZE+DknD4PAHILfdfr0r3mM08kBc6ryg36z79AaBdI/TrScBb0i
 YqP7Ye82SYVq1wYoDRg67HMMdxEb67tK0P6s56mCx5+bozBshVbAFe5u3vCT0RLvA0Rp
 R7hVjTVl3KwgOtZ6JLV5xS7gaT2JxKY1RW/xCypn/ocC+NETtGud7EMNQ7rUHbmjDp7m mA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2w9gxpg3ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 00:29:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAF0TBTh006674;
 Fri, 15 Nov 2019 00:29:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2w9h171780-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 00:29:26 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAF0SAK0027264;
 Fri, 15 Nov 2019 00:28:10 GMT
Received: from localhost (/10.145.178.64)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Nov 2019 16:28:09 -0800
Date: Thu, 14 Nov 2019 16:28:07 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: ira.weiny@intel.com
Message-ID: <20191115002807.GN6219@magnolia>
References: <20191114231943.11220-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114231943.11220-1-ira.weiny@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9441
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911150001
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9441
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911150001
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iVPUe-00H5Bz-Hn
Subject: Re: [f2fs-dev] [PATCH] Documentation/fs: Move swap_[de]activate()
 to file_operations
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

On Thu, Nov 14, 2019 at 03:19:43PM -0800, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> Update the documentation for the move of the swap_* functions out of
> address_space_operations and into file_operations.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
> Follow on to the V2 series sent earlier.  If I need to spin a V3 I will squash
> this into patch 2/2 "fs: Move swap_[de]activate to file_operations"
> 
>  Documentation/filesystems/vfs.rst | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 7d4d09dd5e6d..03a740d7faa4 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -731,8 +731,6 @@ cache in your filesystem.  The following members are defined:
>  					      unsigned long);
>  		void (*is_dirty_writeback) (struct page *, bool *, bool *);
>  		int (*error_remove_page) (struct mapping *mapping, struct page *page);
> -		int (*swap_activate)(struct file *);
> -		int (*swap_deactivate)(struct file *);
>  	};
>  
>  ``writepage``
> @@ -924,16 +922,6 @@ cache in your filesystem.  The following members are defined:
>  	Setting this implies you deal with pages going away under you,
>  	unless you have them locked or reference counts increased.
>  
> -``swap_activate``
> -	Called when swapon is used on a file to allocate space if
> -	necessary and pin the block lookup information in memory.  A
> -	return value of zero indicates success, in which case this file
> -	can be used to back swapspace.
> -
> -``swap_deactivate``
> -	Called during swapoff on files where swap_activate was
> -	successful.
> -
>  
>  The File Object
>  ===============
> @@ -988,6 +976,8 @@ This describes how the VFS can manipulate an open file.  As of kernel
>  					   struct file *file_out, loff_t pos_out,
>  					   loff_t len, unsigned int remap_flags);
>  		int (*fadvise)(struct file *, loff_t, loff_t, int);
> +		int (*swap_activate)(struct file *);
> +		int (*swap_deactivate)(struct file *);
>  	};
>  
>  Again, all methods are called without any locks being held, unless
> @@ -1108,6 +1098,16 @@ otherwise noted.
>  ``fadvise``
>  	possibly called by the fadvise64() system call.
>  
> +``swap_activate``
> +	Called when swapon is used on a file to allocate space if
> +	necessary and pin the block lookup information in memory.  A
> +	return value of zero indicates success, in which case this file
> +	can be used to back swapspace.
> +
> +``swap_deactivate``
> +	Called during swapoff on files where swap_activate was
> +	successful.
> +
>  Note that the file operations are implemented by the specific
>  filesystem in which the inode resides.  When opening a device node
>  (character or block special) most filesystems will call special
> -- 
> 2.21.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
