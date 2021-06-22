Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F633B063A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jun 2021 15:53:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvgpk-0004XS-Gf; Tue, 22 Jun 2021 13:52:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pavel@ucw.cz>) id 1lvgpa-0004Vc-JI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 13:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q2Uivpi7iotcGLpkfB9mWjcRBmJ/lSAC7wNDIHk1Ouo=; b=IpjEjTo72PDF3XZI96B+oOMqiQ
 yAakj7WfZxHxWxE+srWBPC8G+y4fFNn+EwPxC7qpO9gYulHwt8W8nHiEuBWTpNSGquYE5q3nJKq07
 XQKn6C+xDgsbErqPi8WAiSEU1iZN5G8BpOAW+xmuvRJulAd23OIhl01+dU0SgY32nM9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q2Uivpi7iotcGLpkfB9mWjcRBmJ/lSAC7wNDIHk1Ouo=; b=LyORnYxk+nd4b123VseIGQxsSE
 b7JCwPJSkwDFigvSMgdbNvBG3yZsQ2SNDwBM17GnA/6NPIel/4FH4hLELBHuucXF40lYu6TvU8B8D
 oOs3Lx22rOfWM4GqwoZOwcyy73rcA/F0B0Gqha3hUi8GRjTrkBKxPZYMlAHpEkcWGWW4=;
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lvgpO-00027S-1A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 13:52:46 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id C50E71C0B76; Tue, 22 Jun 2021 15:33:59 +0200 (CEST)
Date: Tue, 22 Jun 2021 15:33:58 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Robin Hsu <robinh3123@gmail.com>
Message-ID: <20210622133357.GA1003@bug>
References: <20210611073111.947552-1-robinh3123@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210611073111.947552-1-robinh3123@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: cuni.cz]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lvgpO-00027S-1A
Subject: Re: [f2fs-dev] [PATCH] sload.f2fs: Reword "IMMUTABLE" in
 strings/comments
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi!

> Since the IMMUTABLE flag for compression is now changed
> to F2FS_COMPRESS_RELEASED, some 'IMMUTABLE' words should be changed too:
> 	1. sload help page
> 	2. inline comments
> 
> Signed-off-by: Robin Hsu <robinhsu@google.com>

> @@ -650,7 +651,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  				}
>  				c.compress.min_blocks = val;
>  				break;
> -			case 'r': /* compress file to set IMMUTABLE */
> +			case 'r': /* for setting F2FS_COMOPRESS_RELEASE */

Typo.

Best regards,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
