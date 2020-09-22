Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3527437D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Sep 2020 15:51:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKihO-0000J0-Gh; Tue, 22 Sep 2020 13:51:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kKihN-0000Ih-Bl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Sep 2020 13:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=juxzgTElchraTGCD4haW5EUAhVmmuTDZC30ad1kXrGY=; b=GJcN9d0ChuKZcemxMzob6WFum3
 NjxbNoxin+Ky6o6bgWxqa1LhiwPhsQLEhi5Ua0/1Lm5BZvJSa1Xq3EWmkhxxVJRJv2zm+CYaXZeJ4
 xMzlN9FpiCV2rGZt/N82BciAxpUMVrRl4fg+4CyrRacKudJZtEgLErwbsixW+rZjOzdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=juxzgTElchraTGCD4haW5EUAhVmmuTDZC30ad1kXrGY=; b=JkAB3tiREUqarUPX+I6PmsZ904
 Q0I3dnm8bzhxRKmejzkeF/YvISJ6wZ4zMYunYal4uQbs2uHV/i5BUKhrrsfeImfYINGO9e+CboH+/
 yUVPhMfYY+iRp04v+4vnbkQ6lqSIT4ULVX8ZPpNyO++TeUTiAQVGM7WDXexwXPF00g74=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKihH-003FgI-RU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Sep 2020 13:51:13 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9067720936;
 Tue, 22 Sep 2020 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600782658;
 bh=ah1oRV9AwF+HOR2QyLQpuVaKZLQO4RCWcJodnzc0oZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lFnv75YWIDQtPV1/37RjVPZCmc+w2raAzyDf/lBUX1xGdOF8/y+Of5HNgNyEuZYLq
 xs9upAb8I7B4MYDl7BdVbpmP9X/DKc9mF/70oyWM03GRglhaS8264ijKmOZchSpuYs
 fmOc1tLmvl8aKCckC1nqPNCydNFXGW3Um2IiQCWY=
Date: Tue, 22 Sep 2020 06:50:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20200922135057.GA5599@sol.localdomain>
References: <20200917041136.178600-1-ebiggers@kernel.org>
 <20200921223509.GB844@sol.localdomain>
 <da7f608e01cd8725d8da668f1c4a847b29b9de68.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da7f608e01cd8725d8da668f1c4a847b29b9de68.camel@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kKihH-003FgI-RU
Subject: Re: [f2fs-dev] [PATCH v3 00/13] fscrypt: improve file creation flow
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
Cc: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 22, 2020 at 07:29:45AM -0400, Jeff Layton wrote:
> > 
> > All applied to fscrypt.git#master for 5.10.
> > 
> > I'd still really appreciate more reviews and acks, though.
> > 
> 
> You can add this to all of the fscrypt: patches. I've tested this under
> the ceph patchset and it seems to do the right thing:
> 
> Acked-by: Jeff Layton <jlayton@kernel.org>
> 

Thanks, added.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
