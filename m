Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F95E2464D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 05:29:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSvTL-0000VJ-32; Tue, 21 May 2019 03:29:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hSvTK-0000VD-Kb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 03:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cy1jEumYvJpU4tb0Gkq+xMP4m+4a86jMde3cJwn68AQ=; b=X6sDmOqBomb74RYgxLj6LhnTH4
 5IL2p++DGM0/3TJ1+UoA2ynbs/XTEKjwbgJmCOA1pQiICi0XW0OCB7qn5h5mZs9QHmOjDt2Z8kQJ0
 LWcad6MD8HCwKuWynT/tbRu5S4hWyCK7hZoEl38U/dVRZEC1/ha/IzmR5IbiLUqCOnzs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cy1jEumYvJpU4tb0Gkq+xMP4m+4a86jMde3cJwn68AQ=; b=METZvi5p8DARdyS/14OGzi1zqA
 rpr3goyiHjo8OpSJ9l8NVPVV69Tqby+rUDopxARr4Nz2n2kseuPKxebblvLRri/zA90QcoJGclALA
 xXJfVG+1SEX8UMdl3Hc/OQGU1hNcTHwgxWDrLO8jyIqXCJrvCJ6IvwouA8GqS+Kkcuxc=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSvTI-00CqKS-Ic
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 03:29:50 +0000
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x4L3TZTB032052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 May 2019 23:29:35 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id C8793420481; Mon, 20 May 2019 23:29:34 -0400 (EDT)
Date: Mon, 20 May 2019 23:29:34 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190521032934.GA14876@mit.edu>
References: <20190520172552.217253-1-ebiggers@kernel.org>
 <20190521001636.GA2369@mit.edu>
 <20190521004119.GA647@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521004119.GA647@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hSvTI-00CqKS-Ic
Subject: Re: [f2fs-dev] [PATCH v6 00/16] fscrypt: key management improvements
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
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 20, 2019 at 05:41:20PM -0700, Eric Biggers wrote:
> 
> This was answered in the cover letter, quoted below:

Oops, thanks.  My bad, I stopped reading when I saw the changelog, and
missed that part of the description.

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
