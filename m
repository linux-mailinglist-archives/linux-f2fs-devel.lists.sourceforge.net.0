Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E643C6DB4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jul 2021 11:45:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3EzD-0001Uo-Kk; Tue, 13 Jul 2021 09:45:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m3EzC-0001Ua-Ey
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 09:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2L6698rm8Cp7n1ZoMFC5kLXdhF5RNU9V88jDD0QOQh4=; b=Y5DRBLjGu2jCSXB+r3XhsbdeFn
 rqKnWaO2oLZ5erBpOO3pJD48l6bH6crmqDtPpBlXb75enmSntu7gUJlTb22Tfkqfm0eCbfF3rihv7
 avk3kl1WP8Hp5hNvcisGCZlCB9B2iycpJp9KUdjzO6M47bkg9gqGfwPJB+I/w3JjJT2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2L6698rm8Cp7n1ZoMFC5kLXdhF5RNU9V88jDD0QOQh4=; b=bYsh8AVKbdSvHNLXanHrgqOGHM
 yCw+06J+ajo3QHp9vDesmbmHxMxDDq99zrBElWOkp8BB4nxakb8dT0NcC9TKSTYBhxF+OPuF2YiIt
 azDw5IfPOsY31/SRJSWrmP3Hr53mCmS9OKKLb5gbm7sWONKMGTjTo/jeiLvJiFd6hTMI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m3Ez5-006nFP-D8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 09:45:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36D6D610D1;
 Tue, 13 Jul 2021 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626169541;
 bh=MHQ1hi9DJCsnIHnR5dYbmLFq91e4rfwqt+lKqramo5c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SEhAkeQKLoRENbnWEaKMB+PevkfQGmbGzzSgWsBlRLwysZSA+jPll7J3dBOZEtsIu
 5Yt9oM7r7zI6/Z3at27zmg5vbIRi924WkfGprzznw6Y1o/lOKCfIZDMUQVEn5gtVXW
 /DD/QngVkmlJ2qmoVN3+w8jN3QQeRr5zlB1ga7PL7C5WLcfb7ec0U3n9xWjAK+tHuD
 +IqbunAqJls8cV+yGt3EUYbFtC3QiGBodPdgTt/Q9rl7+aazOJtEwGhs2e9HB9cq51
 VSzvmiF3hWdgA9qXHl/029xKPVr0tYUEpbP4nUl7pFK2Phe8+kWt0qzkCd0OL5MWvx
 M0Qf6y9jkXXPA==
To: jaegeuk@kernel.org
References: <20210622115059.24860-1-changfengnan@vivo.com>
 <7e7d1dec-d245-8451-7a08-20c0c937c21b@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <73528afe-8331-85af-48c1-f9d733ed8e39@kernel.org>
Date: Tue, 13 Jul 2021 17:45:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7e7d1dec-d245-8451-7a08-20c0c937c21b@vivo.com>
Content-Language: en-US
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m3Ez5-006nFP-D8
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: remove unneeded read when
 rewrite whole cluster
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/13 10:35, Fengnan Chang wrote:
> Hi Jaegeuk:
> 	Any comments about this version?
> 
> On 2021/6/22 19:50, Fengnan Chang wrote:
>> when we overwrite the whole page in cluster, we don't need read original
>> data before write, because after write_end(), writepages() can help to
>> load left data in that cluster.

Jaegeuk,

Let's queue this in dev-test for testing?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
