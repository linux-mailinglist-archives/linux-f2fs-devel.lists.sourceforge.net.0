Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83802120354
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2019 12:09:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1igoFW-000531-3Y; Mon, 16 Dec 2019 11:09:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Markus.Elfring@web.de>) id 1igoFR-00052f-4k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 11:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Subject:References:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LR5TrTfJf9OCP2JT7Pm2BdimReFaQvZ/3KwC8olmOUY=; b=T6ULmjSGYaCkZKdyiqYCGMNTW
 83um3lzqrIJ5Kp/zx499u3fuPvf5loAYGX6Ms5dgwdD/nM4iytvCeWtyf43wGb9yF0am4LbRdFNdI
 me0Qhr3VKlqUU9gsXOg1LjBYTBFBe2Qe4Sp9R5hVPf5pnWoe+b2tV5MZmExwW6KbCpmyM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Subject:
 References:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LR5TrTfJf9OCP2JT7Pm2BdimReFaQvZ/3KwC8olmOUY=; b=fxDLBjEcJrie8RBSXWyd1LYUke
 9dLy0QPc1c//axnJMp488BBGPB7FY+4axC9btW7VUfiYJo0Tk9JC0p39z+WHXEpxS8EsULfgCHhJL
 zT0jg2pqPkPjj8hIoQuyfzpeYV0rO5Tid6qm2o/7EyIAaOXF2muvWeoHfISS9cVPDHSY=;
Received: from mout.web.de ([212.227.17.12])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1igoFK-006ZGC-A3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 11:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1576494521;
 bh=LR5TrTfJf9OCP2JT7Pm2BdimReFaQvZ/3KwC8olmOUY=;
 h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
 b=GbRXPQvtUJOl9YfN6GU493E8TQJjEKaS8m5c0utIY4JQ5DF9QEjcAx19YnEPV8Jai
 XuNk9bD6Hd4FlJlvDou4YgFB4xsEbI9MCuZ7Coi4Hq8/012YbCtfIHmuW231TMbA/1
 innwJpgqvoEiGno/cVXYEHvJugD1GijNPfp8WFYs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.181.202]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M8zSL-1iYnsi2iVB-00CSJ5; Mon, 16
 Dec 2019 12:08:41 +0100
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20191216062806.112361-1-yuchao0@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a69924ee-2729-3835-da9d-4fa0062c5737@web.de>
Date: Mon, 16 Dec 2019 12:08:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191216062806.112361-1-yuchao0@huawei.com>
Content-Language: en-US
X-Provags-ID: V03:K1:mkN/J7ryt6sWw27AuG5Auhooz2iNAH/kM/hQ6yctJ9+PFvMQHrI
 TiABYNp4i3gDbDy4qp7Rmg+RO3WTlZDhudKWTEm0KzBzv6wFDZoHxEPEPhT20K8iBaEZ763
 l8kTzyyG9TOSJ1yf0lGyeWj5tA6MIyKwNOVGazY8Lb01z8P3JhkNv0puT6uOlwYVCHgBx7i
 h+BzMYEnSGj4p3kNI5Ntg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FrgQSO+8jhI=:eEJaC7Feghz6tXTAEnU8K9
 DDV34c4aTqpJ3CpiK7P4tOPuERVkvP7tkpdUD1QklBKDH/sjP+hmedTzb/UgJ/qMOy2YRkmDz
 KxZ7nu6C4fTTimdFRfWGlQK1ugtrSUwNWi1UQGTmYWKB2KDtXLMLNNLo9fN0uBJNCMNYU1h+4
 PVLikfBfzNx2BhUV+3tjvCmYeoWQSTj/CdXELjZT8cxyu3Y49AZ2dEZh8UcwJWgfugZJkhSeQ
 Vsiygj4vGzB8LR8nbsbysCDxVa7+JqFsBF+OC9qap6oRuy4pvpz1AM1ZxQSTLVhBnNT7poHFW
 Py2OIgjIQl+w+JLyVl8OCxE5Poxq+Ib9iRxmDSS0e0M8FlU36NFUhyVNXwWZEn87sNQkA5hj4
 Cm4uzLuWSS1h1HBYB555EEjWumUSMwM932YMB99GchU+21z/MWTJd2eGXxF6egf8/dIICeguT
 VV2qzSn72ylIioM5GThcxlPMMgDadrpx3KPTc4mbeZOMDarM2+/oRzzzdEcPoV11XSHgR2V9W
 FF4lvcPXchxvldvuSz44ds8HkRlTgyn9dAgQRJ9E8ZQwc3u/mykc8dQUo8d3aRgn0YKRT1rj2
 w4yZG834k/fHBTIO6Z7zDlZVOYDpw8ujD/UEMp6tK4cLm9Rsiwsz/dgGPXHQwO4YHUoPzAMqY
 RCDTiL7am6kosjhEc71v6YKlrsFtUUfHHZOnIfJxQgl3EvSYF3rbVHisbBt450Qj/YaJUODUZ
 08R4Tlwa388Ize9Cj9PLabrpIXl+S+CID+JkrZ2BZnF5p5BeWZb9f84E1D5eNZNN7sa7oKtlE
 ZvWqDMB7xg0LqeIffiK07uN1TJko8k8ESOAg60hXafllCJSLP12o6LqthHoEECQiMOTEOYpZO
 S4zkg19STqX35xSLF4UIwL83m5Z8OV/wNKHh7EQ+k9JQ/FZdV2349U4cCe2PeYMMhWT+Z8S3+
 MY0MiO5PNGpgrkdAK5hvt3KrFFI6co4aadoDQPaG1SPA81L8WITHQEkEQNSuAAAjgpTCCo8gt
 KcND+7clPA29vDd8k66jfLWcU5d5N648KfwOhjtUa/Zh7HdC7l0NySDYWhFS/p/UJUTPFNfYS
 FH6lSVoqmDjT9hxS0d6OQr+UfzTdZVvlrkdwDcM8iUqMT8U7IZ8tgjknTT9Nx5VUONyvSjC/x
 05lCIjKTWxOu91F3AFiEzWrY6Sf8OBFm2GDeO32ZargB593IwKPWwqVoNXhZcV8FbdBaAUa+P
 kKuwefdk8TNbD7Dlmn4bLIqK35OieL7Z1zbwruqWFBKmCFX5hnR0MXRRpvFM=
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (markus.elfring[at]web.de)
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.227.17.12 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1igoFK-006ZGC-A3
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>

How do you think about to avoid a duplicate tag here?

Regards,
Markus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
