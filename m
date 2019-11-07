Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D084F2470
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2019 02:44:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSWql-0001GG-47; Thu, 07 Nov 2019 01:44:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1iSWqk-0001G9-EH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 01:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cn3zXXUmFy7Cq1yV6SlWOhU6ypKw5aRvkQdQRCJrNA8=; b=SQY2B+IClqPB+adJF02Ks1uXgG
 VK7oh0T3+7LEEjM9CaCk8FQL1VAminY3DaYBqr0wTNqmBLB1qcLnJ49cYCr7Y9avySLUGFBrEKGEu
 2XHrvimDaq+okM3vjfk00CuVNMRnFHTVmBlNXlMhWFPnMNCkn26dcKvPp9XfjxO4EUXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cn3zXXUmFy7Cq1yV6SlWOhU6ypKw5aRvkQdQRCJrNA8=; b=Xrr/QCHfT0ZVr/8L3h+57Z9oRF
 tpmked85RyzY4bGIu8j7IrtsVB0PGf6j6pe+j3Y2UsOIu0f/uBwEStbG4l4mU42T4/2lrLV7M1vpr
 8hokVv1FyhQAd53hZc5jdnfEqIHcBoxDRA9KILoX7CZ9QUm3H2eGmtn/vDq4r2qg3dpo=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSWqj-0032Jw-8C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 01:44:38 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA71iQwD165492;
 Thu, 7 Nov 2019 01:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=cn3zXXUmFy7Cq1yV6SlWOhU6ypKw5aRvkQdQRCJrNA8=;
 b=cVgenG4vrO3Qek66gbPNIxj/jnAJPSV4YSh0gepnHx9pBtFJQhfleqMjXysxLngDxX8u
 bRCOmYIJ9GS02/Gp2U8wlZHcHlBFAwKNjvyVLV7IjgkWJYAH0OlivRcWaGaNGufxMd9k
 Dxz+v1RI/JfK7/c0hWZ8faDvGMizLdR0LPcJwVzml+fO95MlpKkawi+7V+IwiqrFvTMQ
 bUKRaSzOJJn65qyxQEoZvwj7CAJyfaLkZ6pxO+VG/g2DNP6r6EKMDNVPADqQDu3oJdPJ
 Z2SRSCg2/4a8+3KGqOJLUdRgSsCPgoSVe6ftbbkzaxhQP/vLVxGjQwEKYhtLgbMRSzUP kA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2w41w0trny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Nov 2019 01:44:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA71ctDO146722;
 Thu, 7 Nov 2019 01:44:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2w41wfw4hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Nov 2019 01:44:26 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA71iMee018191;
 Thu, 7 Nov 2019 01:44:23 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Nov 2019 17:44:22 -0800
Date: Wed, 6 Nov 2019 17:44:20 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191107014420.GD15212@magnolia>
References: <20191029204141.145309-1-ebiggers@kernel.org>
 <20191029204141.145309-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029204141.145309-2-ebiggers@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911070016
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911070017
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
X-Headers-End: 1iSWqj-0032Jw-8C
Subject: Re: [f2fs-dev] [PATCH 1/4] statx: define STATX_ATTR_VERITY
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 29, 2019 at 01:41:38PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a statx attribute bit STATX_ATTR_VERITY which will be set if the
> file has fs-verity enabled.  This is the statx() equivalent of
> FS_VERITY_FL which is returned by FS_IOC_GETFLAGS.
> 
> This is useful because it allows applications to check whether a file is
> a verity file without opening it.  Opening a verity file can be
> expensive because the fsverity_info is set up on open, which involves
> parsing metadata and optionally verifying a cryptographic signature.
> 
> This is analogous to how various other bits are exposed through both
> FS_IOC_GETFLAGS and statx(), e.g. the encrypt bit.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  include/linux/stat.h      | 3 ++-
>  include/uapi/linux/stat.h | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/stat.h b/include/linux/stat.h
> index 765573dc17d659..528c4baad09146 100644
> --- a/include/linux/stat.h
> +++ b/include/linux/stat.h
> @@ -33,7 +33,8 @@ struct kstat {
>  	 STATX_ATTR_IMMUTABLE |				\
>  	 STATX_ATTR_APPEND |				\
>  	 STATX_ATTR_NODUMP |				\
> -	 STATX_ATTR_ENCRYPTED				\
> +	 STATX_ATTR_ENCRYPTED |				\
> +	 STATX_ATTR_VERITY				\
>  	 )/* Attrs corresponding to FS_*_FL flags */
>  	u64		ino;
>  	dev_t		dev;
> diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
> index 7b35e98d3c58b1..ad80a5c885d598 100644
> --- a/include/uapi/linux/stat.h
> +++ b/include/uapi/linux/stat.h
> @@ -167,8 +167,8 @@ struct statx {
>  #define STATX_ATTR_APPEND		0x00000020 /* [I] File is append-only */
>  #define STATX_ATTR_NODUMP		0x00000040 /* [I] File is not to be dumped */
>  #define STATX_ATTR_ENCRYPTED		0x00000800 /* [I] File requires key to decrypt in fs */
> -
>  #define STATX_ATTR_AUTOMOUNT		0x00001000 /* Dir: Automount trigger */
> +#define STATX_ATTR_VERITY		0x00100000 /* [I] Verity protected file */

Any reason why this wasn't 0x2000?

If there's a manpage update that goes with this, then...
Acked-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

>  
>  
>  #endif /* _UAPI_LINUX_STAT_H */
> -- 
> 2.24.0.rc1.363.gb1bccd3e3d-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
