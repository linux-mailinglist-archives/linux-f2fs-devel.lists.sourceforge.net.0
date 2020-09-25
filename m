Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF2278F5A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Sep 2020 19:07:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLrCI-00056Q-Ut; Fri, 25 Sep 2020 17:07:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kLrCI-00056J-8t
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 17:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=03tPwZGQEyDwE6haCeX/g+pOZ6r6CjH/UkU2oRukK+M=; b=aL/AlV81ReAWa2sFlUQSQ0RaC5
 adjEojJz0IXV2GTjWVoSqGRVNQkHC5d+0KS85AAHe7QxSS66qF6O002x/UxC7vlAs8p/cQc0jc/e8
 EOke2OGd3c/EXh2uGx6O2Pst0kESdqQlQtCEfOqPVX0TxtcWTUaGaPG3871kk2nkgNJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=03tPwZGQEyDwE6haCeX/g+pOZ6r6CjH/UkU2oRukK+M=; b=L9KlmJqP+CE7r8MCL78n/Hc6H5
 uBVM5Tl3yOw9F/vxz2BHAtvu/NA+vlnmdwPrdmK0dTSlgpn+6iinHDUv0xljKbsxHb4YX3BVwYc3e
 AGfN3sz2U5rAde6qGemgFZXQAytfmdHkOAoKFcTcymvc/0U/SIvO6GDH+qDENPRYb4js=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLrC5-0085EN-D5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 17:07:50 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CF8520936;
 Fri, 25 Sep 2020 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601053650;
 bh=qCE+4bs1ePStPeePr7vWxYnoWyzPQFMPy3sYBoDYJYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LZdS3kbtoYoRAFqOE93oqEYZdA5J9u5o7dmSS1YtXxJGbKruskpErM/lFW4ZdtFfa
 uVGOKl3dw8pFag9M5D3gaOjX6lSIFREt6/eki+5MopSj6teU2jraETCuer7Y8tNpHE
 hPeOLdOB+uADyNE6wIknAaAjMbaILTrbRfyISeC4=
Date: Fri, 25 Sep 2020 10:07:29 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200925170729.GA2843966@google.com>
References: <20200918030349.19667-1-yuchao0@huawei.com>
 <20200924200305.GA2568648@google.com>
 <dbf3a532-cd38-2b31-e4ab-e83505c6c9c4@huawei.com>
 <7a072554-9d64-b4ac-b85b-de0acd9e507f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a072554-9d64-b4ac-b85b-de0acd9e507f@huawei.com>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLrC5-0085EN-D5
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix to disallow enabling
 compress on non-empty file
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/25, Chao Yu wrote:
> Jaegeuk,
> 
> I noticed that in dev branch there are several patches which have not been
> sent to mailing list, could you please send them out?

Chao, which patches?

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
