Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9BE549A34
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jun 2022 19:39:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0o1h-0002jS-Hv; Mon, 13 Jun 2022 17:38:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <corbet@lwn.net>) id 1o0o1f-0002jM-BD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 17:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k58hDWJfANavQFvKsrGGJcppdon+Ur4ul3J1RTm5fL0=; b=Gxgk2m01bw54N4LwXI9vQNxaQR
 1pV9bZNmSNBdP0NrLd3XdVZ3cytroeUJyLacDS85Kj3pXr1T157EBYdL+kTBZw4T+/R1u125KtsSW
 vwYFQws6ccXZaHGgrHzoI+X0z9Jdnswx3UZvKcvOCdnI6GPox8hUJ50FKDdxTbzHG2RY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k58hDWJfANavQFvKsrGGJcppdon+Ur4ul3J1RTm5fL0=; b=ZcKbttwXxp09ESj1QnN+u9qe6z
 4SSSwpDPIZVGK8FOb/wqzi0c5m0giKTh0XDoasusmEPbZxy+p2Qlbg4KQHD9FoBN8FiCZ+F1TKxwV
 Lym/jJAUiYtG4ahF08tiV5hRaeiI1vH5XEea8CkpOzZy75Cdu0QuM5gOJoCVEKiINMZE=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o0o1b-0008Qn-1X
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 17:38:53 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id AB2EC381;
 Mon, 13 Jun 2022 17:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AB2EC381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1655140987; bh=k58hDWJfANavQFvKsrGGJcppdon+Ur4ul3J1RTm5fL0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NjSw1C6pIAC6Tha3bJMkfoZss6QYYR0CEm5g91/3GPYdVZS2eaj9FgEYMVTTTrRPO
 bsw8H+P29gvcHZCtuSpRgiNJ6J6pXM9APWdle3PaJupADTHs4ZqoOLCvMnNuNXFC4M
 E7TSEZbLhN+YWnNadbNzEmoboX8eorGlkRpfKTc5vuc5trCHooiaRN1RENI2owHmjp
 wrh4zRQm0mZ7CTanfStloZSMmpNOWvxqdb3ec2YqH1w0q08EBSAOyEwAVueRmp07T0
 QdrbTK3lm4L64k4mfCiFRyg1G5QPLln5YWGWXosMIHa5eVrNu0pwjShJ76HmOgzJ0r
 oqUgxOofFipDA==
From: Jonathan Corbet <corbet@lwn.net>
To: Chao Liu <chaoliu719@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Chao Yu <chao@kernel.org>
In-Reply-To: <Yqbu+BArbUNGvft9@liuchao-VM>
References: <20220613020800.3379482-1-chaoliu719@gmail.com>
 <Yqaw3VTD46PAMN8O@casper.infradead.org> <Yqbu+BArbUNGvft9@liuchao-VM>
Date: Mon, 13 Jun 2022 11:23:07 -0600
Message-ID: <87czfc1nr8.fsf@meer.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Chao Liu <chaoliu719@gmail.com> writes: > On Mon, Jun 13,
 2022 at 04:37:01AM +0100, Matthew Wilcox wrote: >> On Mon, Jun 13, 2022 at
 10:08:00AM +0800, Chao Liu wrote: >> > v2: >> > - s/file size/filesize/ >>
 >> Why would you change it to be [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [45.79.88.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o0o1b-0008Qn-1X
Subject: Re: [f2fs-dev] [PATCH v2] docs: filesystems: f2fs: fix description
 about compress ioctl
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
Cc: linux-doc@vger.kernel.org, Chao Liu <liuchao@coolpad.com>,
 linux-kernel@vger.kernel.org, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Chao Liu <chaoliu719@gmail.com> writes:

> On Mon, Jun 13, 2022 at 04:37:01AM +0100, Matthew Wilcox wrote:
>> On Mon, Jun 13, 2022 at 10:08:00AM +0800, Chao Liu wrote:
>> > v2:
>> > - s/file size/filesize/
>>
>> Why would you change it to be wrong?
>>
>
> This is a suggestion from Chao Yu. Maybe he has some other considerations.

Sorry, I should have replied to that.  I disagree with that suggestion.
"Filesize" is not an English word, and there doesn't seem to be any
reason to use it in our docs.

<checks>

We have to occurrences now - one already in the f2fs docs.  I think we
shouldn't add more.  So my plan is to apply the first version of this
patch.  Chao Liu: is there a reason why you didn't add the Reviewed-by
from Chao Yu in the second version?  Chao Yu: is that tag still
applicable even without the "filesize" change?

Thanks,

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
