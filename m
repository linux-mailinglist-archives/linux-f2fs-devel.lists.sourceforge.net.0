Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A99476D6F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Dec 2021 10:29:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mxn52-0000nU-Vl; Thu, 16 Dec 2021 09:29:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mxn51-0000nO-6E
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 09:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YlpZyyMvnFONmFOlSf+tCsGFZDj0rGyn2jV54IPakSg=; b=mUTOYjRcGTX/0onmdvgZiKPimw
 FDGl2n6+I5AkND9gjVzeH/wHZmLx/V8lfKkz0SKHa6FZIACk/SZzSnT/OFgsQZaauH14dmMOux67a
 lh9wc6fi3kVXEfD33Gq0Torw08RQriedQY7ht9x2891kz+Qo9i4iC9WH00T/LQ5FNlAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YlpZyyMvnFONmFOlSf+tCsGFZDj0rGyn2jV54IPakSg=; b=Rewakgs5gsPxdd6TtFNiTzZzm8
 OiWTVpN04gZ9b2uhOFMWxl9T82BMZIGnfAwIvbuHi9SJlwp1RbzrDF2mg3tLNL5KH6uV41XPUxTLz
 NPKtjR8m1CK0GllKFMQhtbYviFnhQBjZ5QdNnAIM7g4SSJItU4JF/Fv3DcmtpELo8iQ0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mxn4y-00030O-RI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 09:29:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A02AEB8226E;
 Thu, 16 Dec 2021 09:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D77C36AE2;
 Thu, 16 Dec 2021 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639646969;
 bh=joOWs1dabUGBgGyvuwn8uRQO5hVspQ3ipYST9yYvF6M=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VEgooGvpQS5V+CITQCJOx9bsEFn8IXRVrX4jNHZKBQOqP9LlibBQn4+65FdzA/BEF
 QFxN/v9Q/sSApiweulB6txOXqEhUZIG5i9VpaFVjO4ZC9oUsMvWfPO2ZRm6DZ6RZCH
 wBs5gS0TN99YJvrR0q3mLK2kdm31ey/qyXlNSkGF1nIV7ruXCrtEKaXrwY66eKk0Ck
 iXEWFkOFqeyn8ShNp/9XVXHajZ45Ng9d+a7B2Pnpp714NcAbXowAk09QT2OZZWgSwE
 LGTWOTvGprwfaQrjNI1GycfVdd0oGnXyzHyp8RX1BKlgnZqVXExiWY0/PL3r/AJfR6
 EKMJcxs33XopQ==
Message-ID: <ad503f40-3c08-e52b-08b3-10c10eb2781f@kernel.org>
Date: Thu, 16 Dec 2021 17:29:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211202092812.197647-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211202092812.197647-1-changfengnan@vivo.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/2 17:28,
 Fengnan Chang wrote: > When enable compress_cache
 option, in my test envrionment, sometime > f2fs_invalidate_compress_pages
 will take long time to finish, > find_get_pages_range ta [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mxn4y-00030O-RI
Subject: Re: [f2fs-dev] f2fs_invalidate_compress_pages sometime take long
 time to finish
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/12/2 17:28, Fengnan Chang wrote:
> When enable compress_cache option, in my test envrionment, sometime
> f2fs_invalidate_compress_pages will take long time to finish,
> find_get_pages_range take most time, is there anyone encounter this problem
> too?  In my test, I have 8 files, each file size was 64MB, do some seq and
> random read or write and drop cache, when drop cache, it happnes, my kernel
> version was 5.10.43. Is there anything to suspect?

Fengnan, could you please test below patch?

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev&id=a4419b29c491f42eb823f281ef242448f85760f3

> 
> Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
