Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF98F1E193F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2020 03:59:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdOsP-0002s8-43; Tue, 26 May 2020 01:59:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jdOsN-0002rp-C6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 01:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=btq/4OcEJflcFW1CB5eqLIJ8OPqaboV/0rlkS+yS+AQ=; b=St/7bBd7i4WZ6xljdwK38h4dtL
 4x3iS63ErpwYyTFi4Kgq1MCehu2vN9PI3mYIIpqPZS9KshIr1kOEeyKnbz8WwM8rxvQGNoEJxJGSF
 AYlFNY2QNpQMmkqA2EaqOkCc4DPDgjyZdDdXdFkKC/Pr8CU6ig7K6JUeOrTeID+Z1iYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=btq/4OcEJflcFW1CB5eqLIJ8OPqaboV/0rlkS+yS+AQ=; b=O
 AvZI/uCBQDqBJHwXCJrreFSJddB6DV3XMa+/r1b+ibiTlcf0Sfqb57F3n6jFe8skWlfVVxF34o0Hw
 FEWvO0d3AeGPyycS20sVrrq6Qz/KtycjIrBhEIrBMDlTlZcCQpP9ysnOyFQ8qYVx3j8D58sSnVZA2
 qLXGphKda2+2k57c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdOsJ-0071sv-U3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 01:59:31 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80358206B6;
 Tue, 26 May 2020 01:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590458357;
 bh=btq/4OcEJflcFW1CB5eqLIJ8OPqaboV/0rlkS+yS+AQ=;
 h=Date:From:To:Cc:Subject:From;
 b=qHkHoRTTfZ/MCfi6KTB6bTvwVJjuytl+E60M9D3cCMNFbBWg/TmzZ6yIErQkKmUpp
 IB/4YIRD7rcUb+FIWb/pv2XP0so+FER6v1wt+cxpTI9yD0oWyAtCzDzjvZire+7vUw
 p08P9IY0sgbjErWtaNPXz9EM2rXEzxGWbQB/FV4M=
Date: Mon, 25 May 2020 18:59:17 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: yuchao0@huawei.com
Message-ID: <20200526015917.GB207949@google.com>
MIME-Version: 1.0
Content-Disposition: inline
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jdOsJ-0071sv-U3
Subject: [f2fs-dev] Discard issue
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
Cc: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

I'm hitting segment.c:1065 when running longer fsstress (1000s) with error
injection. Do you have any issue from your side?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
