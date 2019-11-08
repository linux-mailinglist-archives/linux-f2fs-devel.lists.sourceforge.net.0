Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F11F3D09
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 01:47:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSsQq-00039D-6s; Fri, 08 Nov 2019 00:47:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1iSsQo-00038W-Qa
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 00:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qCzBTULDiMobFm746wjs1oajkPZhfNQUtF4ENZEcn1w=; b=K9/1+a0ggTXyQ2lzTyiopa4915
 RBqlow2L/h6AMJQ5xdoLbZFuZq5R4o6399RVUihXzobDS69Ld/p73aGwI95+jFDXMA9sEkYbjpE7u
 b5QkAIzLuwPpelRotHfGRdzNaJZdvnfQGDQ7VGMD2Q4tswxxb2jPZtDN3SbeL5/Lk6hE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qCzBTULDiMobFm746wjs1oajkPZhfNQUtF4ENZEcn1w=; b=UPgRavMH8GvbUd2uSKeKTWwHi3
 8SRlpdBa1CAQjKndastPliNTZCrb/kFW+BxD11ROLa1QCypfPo9cDSzPhXUaAWGOtGqRHHTntXScf
 LNfUNcaKu41LDh7Uo4exsU/Pe19Ils1iOV+z9KTPOvgiFsw0w97WSuqgWLrSHFZkiFZg=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSsQl-004LzX-Bg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 00:47:18 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA80dGWK173022;
 Fri, 8 Nov 2019 00:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=qCzBTULDiMobFm746wjs1oajkPZhfNQUtF4ENZEcn1w=;
 b=Scy8BtcjDBRW5XBvtpGEz2DRtoNA2JOY8Tco7w5Og/99OFUexQFaKKfq6x1rcRq0Sqg9
 Xxw4dYmicSsch/goEwUtXaBIHAw6mPfAb+wO5M1zPlUVIL0S4OXwUQTKE5yY+QK4GJeh
 EaqFZ88ILwrzsSv9BZa9NBkEP5+sYG9HrECVLrW9SI7bf04+RLDx97fpKFG2No8OJCWe
 Rb6kC07voC3YpMlq34QLJPkZVcvmL1cM1sKlkm+x1qmTKx3wm3H7ksMmFYG61U6bX8MB
 Q104R8ul6rr/aBvkVFXnrEkMN6Bzc9tlTn1LvIo0mhBOhd7s1kfUnxvup/hA/jWsVZr3 UQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2w41w19xe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 00:47:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA80dEpU135124;
 Fri, 8 Nov 2019 00:47:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2w41wg9u0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 00:47:02 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA80l13R014531;
 Fri, 8 Nov 2019 00:47:01 GMT
Received: from localhost (/10.145.179.16)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Nov 2019 16:47:01 -0800
Date: Thu, 7 Nov 2019 16:47:00 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191108004700.GA6213@magnolia>
References: <20191107014420.GD15212@magnolia>
 <20191107220248.32025-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107220248.32025-1-ebiggers@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911080005
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911080005
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
X-Headers-End: 1iSsQl-004LzX-Bg
Subject: Re: [f2fs-dev] [man-pages RFC PATCH] statx.2: document
 STATX_ATTR_VERITY
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
Cc: linux-man@vger.kernel.org, tytso@mit.edu, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, dhowells@redhat.com,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org, victorhsieh@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 07, 2019 at 02:02:48PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Document the verity attribute for statx().
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  man2/statx.2 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> RFC since the kernel patches are currently under review.
> The kernel patches can be found here:
> https://lkml.kernel.org/linux-fscrypt/20191029204141.145309-1-ebiggers@kernel.org/T/#u
> 
> diff --git a/man2/statx.2 b/man2/statx.2
> index d2f1b07b8..713bd1260 100644
> --- a/man2/statx.2
> +++ b/man2/statx.2
> @@ -461,6 +461,10 @@ See
>  .TP
>  .B STATX_ATTR_ENCRYPTED
>  A key is required for the file to be encrypted by the filesystem.
> +.TP
> +.B STATX_ATTR_VERITY
> +The file has fs-verity enabled.  It cannot be written to, and all reads from it
> +will be verified against a Merkle tree.

mkerrisk might ask you to start the new sentence on a separate line, but
otherwise looks good to me. :)

--D

>  .SH RETURN VALUE
>  On success, zero is returned.
>  On error, \-1 is returned, and
> -- 
> 2.24.0.rc1.363.gb1bccd3e3d-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
