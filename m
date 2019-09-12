Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84099B0AB2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2019 10:53:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i8KqY-0006ze-PS; Thu, 12 Sep 2019 08:52:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <riteshh@linux.ibm.com>) id 1i8KqW-0006zX-S6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Sep 2019 08:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qOnTpSfiQ5y4Wd31/aR9I2ouWDlnXUs3dss6/dEv0ZE=; b=QQHiH4AqZ7SB1/DJk6MVEI+5Ih
 6KAOQSiCzAlLmQ5yZIILzmvFfBYr3LajJZIur4JeSTvPDHFCt/r2ijNyRSUrsL67mH55Irl4TPiTt
 fG1e3/W9+RZCDWQlo9/a6FFl5gFf75A6fguMfeDq//n8IY39XdXrrYY5c8Cm1r6H6a5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qOnTpSfiQ5y4Wd31/aR9I2ouWDlnXUs3dss6/dEv0ZE=; b=bgrC+kntcU7n9Ndxq/VHRtlsE0
 yCbcYfW1E8+7xJXR8bgVca42wfoeMq0AriQzvtFRkZsCDr7OrPCZWPMfd9v6r+EPUkMOfXmGwqcsd
 cI+LQhxWKXn7mgSHWBYRpB7aIdttmMkPNtfzxIIKPqJUgPvDwCh0OSSbgqknui9wu4PI=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i8KqT-001pIp-0x
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Sep 2019 08:52:56 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8C8jY72114063
 for <linux-f2fs-devel@lists.sourceforge.net>; Thu, 12 Sep 2019 04:52:46 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uyhn6jsj3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Thu, 12 Sep 2019 04:52:46 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <riteshh@linux.ibm.com>;
 Thu, 12 Sep 2019 09:52:44 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Sep 2019 09:52:40 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8C8qEv915204728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 08:52:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 519A242047;
 Thu, 12 Sep 2019 08:52:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C51642042;
 Thu, 12 Sep 2019 08:52:36 +0000 (GMT)
Received: from [9.199.159.54] (unknown [9.199.159.54])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Sep 2019 08:52:36 +0000 (GMT)
To: Goldwyn Rodrigues <rgoldwyn@suse.de>, linux-fsdevel@vger.kernel.org
References: <20190911093926.pfkkx25mffzeuo32@alap3.anarazel.de>
 <20190911164517.16130-1-rgoldwyn@suse.de>
 <20190911164517.16130-3-rgoldwyn@suse.de>
From: Ritesh Harjani <riteshh@linux.ibm.com>
Date: Thu, 12 Sep 2019 14:22:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190911164517.16130-3-rgoldwyn@suse.de>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19091208-0012-0000-0000-0000034A5978
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091208-0013-0000-0000-00002184C50C
Message-Id: <20190912085236.7C51642042@d06av24.portsmouth.uk.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-12_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=979 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909120092
X-Spam-Score: 1.6 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.6 FORGED_MUA_MOZILLA     Forged mail pretending to be from Mozilla
X-Headers-End: 1i8KqT-001pIp-0x
Subject: Re: [f2fs-dev] [PATCH 2/3] ext4: fix inode rwsem regression
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
Cc: aneesh.kumar@linux.ibm.com, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-ext4@vger.kernel.org,
 andres@anarazel.de, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

cc'd Matthew as well.

On 9/11/19 10:15 PM, Goldwyn Rodrigues wrote:
> From: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> This is similar to 942491c9e6d6 ("xfs: fix AIM7 regression")
> Apparently our current rwsem code doesn't like doing the trylock, then
> lock for real scheme.  So change our read/write methods to just do the
> trylock for the RWF_NOWAIT case.
> 
> Fixes: 728fbc0e10b7 ("ext4: nowait aio support")
> Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>

This patch will conflict with recent iomap patch series.
So if this is getting queued up before, so iomap patch series will
need to rebase and factor these changes in the new APIs.

Otherwise looks good to me!

Reviewed-by: Ritesh Harjani <riteshh@linux.ibm.com>


> ---
>   fs/ext4/file.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 70b0438dbc94..d5b2d0cc325d 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -40,11 +40,13 @@ static ssize_t ext4_dax_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   	struct inode *inode = file_inode(iocb->ki_filp);
>   	ssize_t ret;
>   
> -	if (!inode_trylock_shared(inode)) {
> -		if (iocb->ki_flags & IOCB_NOWAIT)
> +	if (iocb->ki_flags & IOCB_NOWAIT) {
> +		if (!inode_trylock_shared(inode))
>   			return -EAGAIN;
> +	} else {
>   		inode_lock_shared(inode);
>   	}
> +
>   	/*
>   	 * Recheck under inode lock - at this point we are sure it cannot
>   	 * change anymore
> @@ -190,11 +192,13 @@ ext4_dax_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	struct inode *inode = file_inode(iocb->ki_filp);
>   	ssize_t ret;
>   
> -	if (!inode_trylock(inode)) {
> -		if (iocb->ki_flags & IOCB_NOWAIT)
> +	if (iocb->ki_flags & IOCB_NOWAIT) {
> +		if (!inode_trylock(inode))
>   			return -EAGAIN;
> +	} else {
>   		inode_lock(inode);
>   	}
> +
>   	ret = ext4_write_checks(iocb, from);
>   	if (ret <= 0)
>   		goto out;
> @@ -233,9 +237,10 @@ ext4_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	if (!o_direct && (iocb->ki_flags & IOCB_NOWAIT))
>   		return -EOPNOTSUPP;
>   
> -	if (!inode_trylock(inode)) {
> -		if (iocb->ki_flags & IOCB_NOWAIT)
> +	if (iocb->ki_flags & IOCB_NOWAIT) {
> +		if (!inode_trylock(inode))
>   			return -EAGAIN;
> +	} else {
>   		inode_lock(inode);
>   	}
>   
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
