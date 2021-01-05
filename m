Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A4B2EAA5B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 13:05:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwl5E-0007LI-Rh; Tue, 05 Jan 2021 12:05:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Markus.Elfring@web.de>) id 1kwl5D-0007LB-2r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 12:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fhemPGF7qJLSHf9CL6xDUCzO0PgBOO584c32nkmxX3U=; b=AVzALWlxoGk95KAl3npkZ8kE1
 753pU+8WeI5qDi2MCV6mQx6aJJUDbS4TkYTbTMCHN2d6I1VN0UYvdP0pWJZNO6u8Ta9iOvGrQJhwB
 031icSHe+MIw9EYdxuahE3K0yx5mR9PGFoAmk2Ils+7Eho2XXMvnaVj6JAIptEbQA56cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:
 References:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fhemPGF7qJLSHf9CL6xDUCzO0PgBOO584c32nkmxX3U=; b=V2hEKJ6EhS4WeJM5r0Qkeg1rO+
 4+tPGBcFUQrA0KOaBNpRoZNMq2TCEy1Wezsn2wx4gH4bhb/CJJ/NpIlt2zGgzwmE0vYPHM1e+ZazZ
 VR8MI5t9qfqMWBz9ZjhpyHOsvKxaXE5mTMy42mUvASv+6YHo5ZI8OlcqYu71AZQfQpng=;
Received: from mout.web.de ([217.72.192.78])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwl57-00G0oU-EI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 12:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609848278;
 bh=fhemPGF7qJLSHf9CL6xDUCzO0PgBOO584c32nkmxX3U=;
 h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
 b=nyDkzO/MeDZVaA/Z1wC0XS73yKw917jG7KI5IfIpsZ3EQm+rJlXusqhojGdAIDXQ8
 JddX3yrEjHoeR4i7MdhajkwaCcTjuoHfxOqnLPNjg8C6NV4/XuEyOVwaRnoyhcDXcq
 1D8AtCIilRp4vAJQNWdCM2Gwekd+4ItltGp6XA6I=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.88.233]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MgiXO-1kKNv02DAC-00gzgx; Tue, 05
 Jan 2021 13:04:38 +0100
To: Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org
References: <20210105041630.1393157-1-daeho43@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <dba4be04-70dd-d48b-391c-1f2355591097@web.de>
Date: Tue, 5 Jan 2021 13:04:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105041630.1393157-1-daeho43@gmail.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:x4pF7iywt+BKKZhJAPhZyAEAScdbkNldZs5m08C7RqYDjC9IntX
 tGIg28OZcS72GU4fwKeihfIr3dhFVJDw9BTmYoDprdJBmrprWev4Elc+3N4eyKk75REPB4h
 sPcxrfC9HlC/hH02aDML3bixW6n5u7raNdopdZNWaQPIF75doTZqIiz9NC8ucutYrmdY6V5
 P4MgZM/QMGBT6eqcLjEvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q6MEQjG6Kzg=:xC3cRA30Llb3CVgvCfJAbu
 IclC4jVN1E6+ff84mL265ZhShiq5G9Aog7MjkuXYwRYAJirL1YdwA2XKMEBxBrjboTq/bEv0C
 kUK/8BKSem/uAoO6Wfju0YzWyElYt383z0b4R7qPlOhHyyXbz56S5UhaTJgDbCus5gg1uSjXS
 PU7KoG3ExJ3u1FB2AVKW+CG0I+hGN1k4L4MdHOCbzWHuzvP9x57D5gqHuYJ7v5O5+alZJxYXX
 pOLDB96J905kBSsi+OkYOp1M6slH4qEaLoqoTN+dCwJOiO/+tF4wa7foQZCMRA94wastXoSIp
 8Q1/mNdY5APZHTdaOIlFK5RFQ+cQMzbClO3mdXhz9qUm11pdhKYUPfEmoyD1tbmrwsh/hDDA/
 ZeMqDlAs461yYkFa955C081OnV4dtDumVqbhYD3UzIQO6KeacDyol8hmJoRnk1eHSgvwMXLuy
 XOCYsLoMj1zIAV7Pe5Nd6qMInebT0nwTNsgda2mdVo2daOvOzDfguLyvmxr72xvDXhw+n4xHC
 1Mb2xYFXdLkeX9BgjfDGfTD485dtUd0dakUw/UrWbwqpKPAIiNJwBjE7eXGgPyeMXLowrNVsb
 09wij1lJI7bCS49tptxeDZYT+cRdLys/DtUn6jTEDXHreSdHrsjF4Q6zznHdjhjWqqAHdxjb+
 IEJ2ue+VM+nwQ997LN6Zxt3PyZw6cvZHG1SNOMMhbs1Ij1SCPOqNy7UihJnRfKFrkNfhRWRyC
 cxcxmhRPcOw4Garke9bD8DljwUsjOv1BVbmilT4seTv1B3u4evB5LeofhwsQNTSTdj1P0iWaV
 hg01YTItl7lKuNPVwq8gfzRmEU9m05Fadi2C1RBnp8a37JNlGIh4XpP8wKjfuNPiX0Jz6comV
 dbQtRxm1motIuN78EwHA==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (markus.elfring[at]web.de)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [217.72.192.78 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kwl57-00G0oU-EI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix null page reference in
 redirty_blocks
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
Cc: Colin Ian King <colin.king@canonical.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> Fixed null page reference when find_lock_page() fails in
> redirty_blocks().

I suggest to choose an other imperative wording for this change description.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=36bbbd0e234d817938bdc52121a0f5473b3e58f5#n89


> v2: changed error value and break the loop when error occurs

I propose to use a return statement instead of a break in the second if branch
for this function implementation.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=36bbbd0e234d817938bdc52121a0f5473b3e58f5#n481

Regards,
Markus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
