Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E3976A2B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 15:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sojdO-0003nB-Na;
	Thu, 12 Sep 2024 13:13:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1sojdM-0003mr-6x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XgGsrf7dA6CpjvI9fBVgqtnxnzZ8jdii2mjMffhIatM=; b=AI+WZtiQ0dEZ/PnzVB+q82DI47
 40xReYeJPPZqKB6NjwTKY0UFyTmCl4pvcEJFWp8vUhr+Io8k5Dc0nZqZZSidlQsXP/2EUnNAUaWLb
 oSBE7hClLRaKPsKHqrvGrR/Re3S0AdC9RSRgVmDeAPrwt5DCJzbW1GbBR9Fh7/y9O4cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XgGsrf7dA6CpjvI9fBVgqtnxnzZ8jdii2mjMffhIatM=; b=lvvOJVlsuqYuhVNKKHKBmAVXgq
 7OrUIdqcTkzd3GLEMKEIM0Rnp31CmpW27lQNCQ6FEd5AbE8dul5xPA9Tsq3HlLGMRqD/q1gp1NPAi
 L3ym2ltMAxXyiHxHXsZ0fHUgXG9AZSd6SlYkv7chFw9B/zgdG7i8ixfY0oTDyFQLlBu8=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sojdL-0007jR-Ao for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:13:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 944E4227AB6; Thu, 12 Sep 2024 15:01:46 +0200 (CEST)
Date: Thu, 12 Sep 2024 15:01:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240912130146.GA28535@lst.de>
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151052epcas5p48b20962753b1e3171daf98f050d0b5af@epcas5p4.samsung.com>
 <20240910150200.6589-4-joshi.k@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910150200.6589-4-joshi.k@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 10, 2024 at 08:31:58PM +0530,
 Kanchan Joshi wrote:
 > This is similar to existing F_{SET/GET}_RW_HINT but more >
 generic/extensible.
 > > F_SET/GET_RW_HINT_EX take a pointer to a struct rw_h [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sojdL-0007jR-Ao
Subject: Re: [f2fs-dev] [PATCH v5 3/5] fcntl: add F_{SET/GET}_RW_HINT_EX
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
Cc: vishak.g@samsung.com, jack@suse.cz, linux-nvme@lists.infradead.org,
 James.Bottomley@HansenPartnership.com, hch@lst.de, sagi@grimberg.me,
 linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 Nitesh Shetty <nj.shetty@samsung.com>, linux-block@vger.kernel.org,
 viro@zeniv.linux.org.uk, kbusch@kernel.org, jaegeuk@kernel.org,
 bvanassche@acm.org, axboe@kernel.dk, brauner@kernel.org,
 martin.petersen@oracle.com, jlayton@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, chuck.lever@oracle.com,
 linux-fsdevel@vger.kernel.org, javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 10, 2024 at 08:31:58PM +0530, Kanchan Joshi wrote:
> This is similar to existing F_{SET/GET}_RW_HINT but more
> generic/extensible.
> 
> F_SET/GET_RW_HINT_EX take a pointer to a struct rw_hint_ex as argument:
> 
> struct rw_hint_ex {
>         __u8    type;
>         __u8    pad[7];
>         __u64   val;
> };
> 
> With F_SET_RW_HINT_EX, the user passes the hint type and its value.
> Hint type can be either lifetime hint (TYPE_RW_LIFETIME_HINT) or
> placement hint (TYPE_RW_PLACEMENT_HINT). The interface allows to add
> more hint add more hint types in future.

What is the point of multiplexing these into a single call vs having
one fcntl for each?  It's not like the code points are a super
limited resource.

And the _EX name isn't exactly descriptive either and screams of horrible
Windows APIs :)

> +	WRITE_ONCE(inode->i_write_hint, hint);
> +	if (file->f_mapping->host != inode)
> +		WRITE_ONCE(file->f_mapping->host->i_write_hint, hint);

This doesn't work.  You need a file system method for this so that
the file system can intercept it, instead of storing it in completely
arbitrary inodes without any kind of checking for support or intercetion
point.

> --- a/include/linux/rw_hint.h
> +++ b/include/linux/rw_hint.h
> @@ -21,4 +21,17 @@ enum rw_lifetime_hint {
>  static_assert(sizeof(enum rw_lifetime_hint) == 1);
>  #endif
>  
> +#define WRITE_HINT_TYPE_BIT	BIT(7)
> +#define WRITE_HINT_VAL_MASK	(WRITE_HINT_TYPE_BIT - 1)
> +#define WRITE_HINT_TYPE(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
> +				TYPE_RW_PLACEMENT_HINT : TYPE_RW_LIFETIME_HINT)
> +#define WRITE_HINT_VAL(h)	((h) & WRITE_HINT_VAL_MASK)
> +
> +#define WRITE_PLACEMENT_HINT(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
> +				 WRITE_HINT_VAL(h) : 0)
> +#define WRITE_LIFETIME_HINT(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
> +				 0 : WRITE_HINT_VAL(h))
> +
> +#define PLACEMENT_HINT_TYPE	WRITE_HINT_TYPE_BIT
> +#define MAX_PLACEMENT_HINT_VAL	(WRITE_HINT_VAL_MASK - 1)

That's a whole lot of undocumented macros.  Please turn these into proper
inline functions and write documentation for them.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
