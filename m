Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005B131352
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jan 2020 15:05:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ioT0V-0002jI-II; Mon, 06 Jan 2020 14:05:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1ioT0P-0002i9-It
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 14:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+kmQXTN3kzWeA8z93aiDVdHZeFlgoRaLfA7PzWAPxk=; b=jPMhcurwWYlhoy7QOwrz72Eb00
 v11TWuIeIM6WdKCWHqA6K5BUuuOE9VdKEmJh5H3wHHm4H+8116lH79V1TFEGS1iswoUN4t5gV7iOy
 MrvN23VG5eWJPt0w+7fWtTlFcFh6t7i4i4ftWDb1ulnH70jDgRHVnU148wyoJ7ZjGA3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8+kmQXTN3kzWeA8z93aiDVdHZeFlgoRaLfA7PzWAPxk=; b=XlNxrUxatY84sNJmT1LRNbRFx9
 MbL7Ree+5Cuz7pgHRzkyuhyj0/FI+5fOKsRq4aOfcNarCVxIMk0r+GiLkdk7QIUYMMQQANygIjHOE
 mal07I/1+WZ+IRjUyAiHyuqY42/wXEUlFXU3J3vg9nimAqiSt8ZTjhuxcPgnNz6sMW34=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ioT07-00BXXd-8d
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 14:05:16 +0000
Received: from [192.168.0.118] (unknown [49.77.182.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9946C2075A;
 Mon,  6 Jan 2020 14:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578319493;
 bh=8+kmQXTN3kzWeA8z93aiDVdHZeFlgoRaLfA7PzWAPxk=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=RKXrPaqbwMvah8GOhNZfpGAMQ4bsFYoGsCwd1kp0D14CA4pZnOLJU7MHB2jKdsDyG
 PZLYWsJoWtviAhL5gjLpZOIxnFrtfB8IIzpjKlO9XdqGT/BQd/AiKU2Eh6ORyXByE1
 EMj0E+Bb2eUcZSW9yEOXxdBkQZJqOCCJZAc6kYTw=
To: Sahitya Tummala <stummala@codeaurora.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <1578021568-21552-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <83a00e37-bc83-b186-667f-089472d2b1df@kernel.org>
Date: Mon, 6 Jan 2020 22:04:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1578021568-21552-1-git-send-email-stummala@codeaurora.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ioT07-00BXXd-8d
Subject: Re: [f2fs-dev] [PATCH] f2fs: show the CP_PAUSE reason in checkpoint
 traces
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
Cc: linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-1-3 11:19, Sahitya Tummala wrote:
> Remove the duplicate CP_UMOUNT enum and add the new CP_PAUSE
> enum to show the checkpoint reason in the trace prints.
>
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
