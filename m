Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF9A2A2F5F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 17:10:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZcPK-0005Px-T6; Mon, 02 Nov 2020 16:10:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kZcPJ-0005Pa-Gx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 16:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aN9ADHWvHYLwcBMuPt2+V78hd3ut0nv6GGHOaLbZgZM=; b=UNK9G1G4JjefDKEHyQVKyJna1X
 8UBRGPv+OAFdV+v+fS9Jenw5KDRL0HLaot5fLGtFjpZ/I7K/2TZC2gb0+s/3fbtrPgovp/RkxxRoD
 mQyv8pp1v7XKFXHA5dum/uFpN1xhSzHnAo9jMPk4tgWrwxWyB+rAdkFdHQHGFn6ZJ6LE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aN9ADHWvHYLwcBMuPt2+V78hd3ut0nv6GGHOaLbZgZM=; b=XBhirIcazRVrCZ0hkE1DRcIfhc
 frnUxfD+tMzTtMdWg+PaMORCcXR1MNzuFimkannSHcOVNuX36hpa603rx19q8GetWevraDXStOP5A
 OHKI8tmkaHOx5k+esaPneik/WJOx5KIWe87JWt3bE6ApRvRI/kTXHLIdnpmxGIl1XIns=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZcPE-006ZXZ-QA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 16:10:08 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFE7122277;
 Mon,  2 Nov 2020 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604333392;
 bh=KjbbvUyNRfIy/F798a/hF/fB5rEyDicNk6ioLYZH98g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ltfOBxu85u043HltVYcOv7N/cagykHReMo1d5xjIWgxmkAW1neFILugRAigchLKYy
 XiUB8T76w27vWSGkQocoKqm+sS/KJT7OONgPFxTkDLYgtxTujn+79cCnb3/KsPMmlm
 dg69SJDU8LH+QRkGaKC0rco7g0lSF+Sjj2BzdBiI=
Date: Mon, 2 Nov 2020 08:09:50 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201102160950.GB529594@google.com>
References: <20201026094000.1500425-1-robinhsu@google.com>
 <299c9027-e137-83ff-b2ba-8af07144a488@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <299c9027-e137-83ff-b2ba-8af07144a488@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZcPE-006ZXZ-QA
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs-toos:fsck.f2fs Fix bad return value
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/28, Chao Yu wrote:
> On 2020/10/26 17:40, Robin Hsu via Linux-f2fs-devel wrote:
> > 'ret' should not have been used here: otherwise, it would be wrongly used
> > as the error code and then be returned from main().
> > 
> > Signed-off-by: Robin Hsu <robinhsu@google.com>
> 
> BTW, how about changing 'ret = EXIT_ERR_CODE' to
> 'ret = FSCK_ERRORS_LEFT_UNCORRECTED', it's not critical though.
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

I think it'd be good to go as is for now. :)

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
