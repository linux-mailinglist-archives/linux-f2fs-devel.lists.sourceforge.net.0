Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 011BBF06A2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 21:07:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iS57K-0004Yq-HC; Tue, 05 Nov 2019 20:07:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1iS57I-0004Uw-Hc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 20:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8cnArdoB8OwMZKu/WOxMCg9/xiqpch1Hdzk9fZwbHk=; b=f97s62u3/WEAcqdJ4nazHG1ouZ
 UqisurYpmviZgS1kJ6Kar4BL7X1mnAHH0/rcTKR3vxm5ztSpfISz4/r9S3q4YgX8OHbm6sS/QGpTt
 8rNRoL41id5I2+rBqGx2Ja8STUI94WI66PxvOz3AOy5QxdSgey4jx36h3OWxkXF6KK+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J8cnArdoB8OwMZKu/WOxMCg9/xiqpch1Hdzk9fZwbHk=; b=BTEPzlh/H3rj0du8kVQE8VAnHD
 NhX8iKc9mSsZQ+F6JNbb4MEOO+9WaL5Lo+1eaqoi0+09ygZUjYvWyP78Y+ZlP8zYdLEy85aGvky3H
 mX9uEPE/y1tMJfC0+N7s2WruzJrXLKXOG++8xpUXx7j3xdNP249ylWxVaIKxiyGArdQ8=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iS57F-001jqR-6l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 20:07:52 +0000
Received: from dread.disaster.area (pa49-180-67-183.pa.nsw.optusnet.com.au
 [49.180.67.183])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 340A77E7AB3;
 Wed,  6 Nov 2019 07:07:40 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1iS574-0006S9-TG; Wed, 06 Nov 2019 07:07:38 +1100
Date: Wed, 6 Nov 2019 07:07:38 +1100
From: Dave Chinner <david@fromorbit.com>
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Message-ID: <20191105200045.GD4614@dread.disaster.area>
References: <20191105024618.194134-1-Valdis.Kletnieks@vt.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105024618.194134-1-Valdis.Kletnieks@vt.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=G6BsK5s5 c=1 sm=1 tr=0
 a=3wLbm4YUAFX2xaPZIabsgw==:117 a=3wLbm4YUAFX2xaPZIabsgw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=MeAgGD-zjQ4A:10
 a=7-415B0cAAAA:8 a=rJHQ1rk6g6_wif3L1mMA:9 a=CjuIK1q_8ugA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vt.edu]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1iS57F-001jqR-6l
Subject: Re: [f2fs-dev] [PATCH 1/1] errno.h: Provide EFSBADCRC for everybody
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
Cc: linux-arch@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Arnd Bergmann <arnd@arndb.de>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 04, 2019 at 09:46:14PM -0500, Valdis Kletnieks wrote:
> Four filesystems have their own defines for this. Move it
> into errno.h so it's defined in just one place.
> 
> Signed-off-by: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>

Looks good, minor nit below:

> diff --git a/include/uapi/asm-generic/errno.h b/include/uapi/asm-generic/errno.h
> index 1d5ffdf54cb0..e4cae9a9ae79 100644
> --- a/include/uapi/asm-generic/errno.h
> +++ b/include/uapi/asm-generic/errno.h
> @@ -55,6 +55,7 @@
>  #define	EMULTIHOP	72	/* Multihop attempted */
>  #define	EDOTDOT		73	/* RFS specific error */
>  #define	EBADMSG		74	/* Not a data message */
> +#define EFSBADCRC	EBADMSG	/* Bad CRC detected */

Inconsistent whitespace here. When you get tab vs space after
#define wrong it only shows up in patches. :/

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
