Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF941A4A4A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2020 21:20:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jMzBx-0001OG-C3; Fri, 10 Apr 2020 19:19:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Markus.Elfring@web.de>) id 1jMzBu-0001O2-Rl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Apr 2020 19:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:From:Subject:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwhx8PyhXtE/RJ68nutnbCkBvUfxgHtWlZzruENlFk8=; b=BVMtg8IwGtYp0XABCvm8jirI23
 EXCwDGW9jVf4u7ik1CviQEi7ER+nCsfE8nwZKi22U4MxggamggRBBDiMz+Qst4mi45v550dEih26O
 Yd/46WInA1QCXxAdMH9pCiAupAPlO00qTTyy4iBTSGroWkpORarC0+FOZstGOoJszq8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fwhx8PyhXtE/RJ68nutnbCkBvUfxgHtWlZzruENlFk8=; b=M
 XtGrjMW2aKT1RT3re+h3yGmY20QvIiOv08jAC56hBGPUAn7P69wsUcRkHo/Q/OYI3hFm0ch1meBDS
 OW6tNqTv/j9B/Ks6HJl91lrBlBuIMT20ryMYjSkC7TH/jlOMfjINKir6hJhl98rXpeQHwLvS76lE0
 gNKZm4D0IT1IEeT0=;
Received: from mout.web.de ([212.227.17.12])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jMzBs-00EdXq-JC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Apr 2020 19:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586546369;
 bh=uczygi9lgHaA8p8RAXvM45HJZvXgU5tp6DAIVrZcPc8=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=SUTnG1v4+uf42uY3o3D9+CFyAtZiui7LCjhPPA7sz4xe8JTu5GbjbzcodWUJ9d3Id
 JoBdiEpjYEsU1vJLL1T8Dw2rDO16ZTC7m/oCKxNvxSOxWvLfM/srS8NeEKua1TJCk7
 InhCQeabb70Gid/Aj5ANhRUu1Y3H15S45xD/pHpA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.110.107]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MBkLb-1jXjtu2LG3-00Ajan; Fri, 10
 Apr 2020 21:19:29 +0200
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <c50f4bff-1c14-931d-ee07-a2f5dc336785@web.de>
Date: Fri, 10 Apr 2020 21:19:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:sKIGAfFKX+r5pmiZ95dge/L+oC4Jbyl/SYb6szi3avKy5wDj8vq
 kfLW1Du7M8ZFimlfAL6EDcebD3JlQ+pd8RlgHbV7VkPIo+Ay1XGNIbjPkVHonK9sxAe8hBC
 IWP4p7E6+HJyKwdMZsoU1U0hZoPwLoFIkJLm8KwW/dh1tEaxfsYu/u9MVpv3CWcfuewR9FJ
 v2UpfrNYHCcrZzPgKKE1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nbBVu/RKUQI=:Qoi8dhBM7xm8VTpfX4NEnQ
 UwXWPPVns0g9XL/2OyjZ6qAuMWS2R1eNd6cY02iGBC+otfdlUVbMiFP+O5OFWhp+FDES/roWX
 /ZYGvQ2jUdLtU2eHvY9r1dQ6xWAutFa1kgCBafxaEfOnk/vIT2uwLC9FwcxhPcVNZ5ToKuZQK
 X20KyGykj71J5j1HeJ0bWZy7juvSdbOXJBIT2BFq0nl+k4J7f80qFsWpGmbwb2SaTJ/iKMUvu
 5PrptkpaBjFETSvpwA3M++LRmCIL/LV+4Igv2lPhmG5eDAxhoZ0EqttXpew8pJJmEehIbQs00
 tomKKZrA/6+/psPtGfBkLDfw3o5dNg6wpuCaeplJkDNdQLbZK1mKn/ABuTBiPfLwhpfMXg2Gv
 syFirGlkSzTXiyR6iMZA6vyuWlD5NUV1vI9/hBsQm8incD3tStQjR+i/nXrXzD0wF9zrF6e/l
 qfStG57CczoUZ+SQLkNwxY/QcDRJsgTBZKXvVtzcVdrkjX/7I85jr09QKvGNzExCeS9sM8m4P
 4YyLON1sn1iP/2YNvl+Pdn4vLbQzOp4RNQ7epx6dIGrOyQR/K4FTFvM+HE1R1JWzOvQY43iFH
 SxeTYnX/q1xZUQSX4vhcqMAh6zHqNhXpCXLoYzY5oYZ5/i2qr+ewS7Cp0vBIoSkQW8Qa30Du/
 c8KNCqv7q0vV4X8vekZNqAoKCyuSiBbSRm6mBK5HBcjFfoPGSFTyQY/l6Oigl877JjcYXQEm0
 BYvceOyMlWxkNmsD2W3Z8C3TmpHUu6OCEl4Lu1D2SXG15Om9PwbM+IB13tEiRfBdduJTXRT/f
 ZiT7NM1jlSx0UucfmiagXirncXlMDe1F1hEIx9qKHVCItdGVN+BN5BPfRQOEqQS0C9AplBNc2
 TIvYEA3umXHAfm2F1d55Of/MCLzuE4mfHWFjNzPl8fHg/gD2LBZc/pQKIoIhVn+oEf/d/gZpr
 4EhqK0+JvPN0hXuzHgAdwIlVSuuuOW/S6R1jQiExYmynxq67w2XqHC7II75GUoAnJ1qtu2sAU
 JCZoxVXYPvWo5HOWZt0lbkjTAmx/nuLBNiwTGw5dej7RuP6lp+2/vqNVrFmVinl6i8y0ZAVVz
 FMC5QL+f4vzH8vx21vOQAbeXQeu1t7Lq/l+BlR6aWoWdvw3Vc0sqnNFqkCUvW9V1OAsBEMZ52
 shqbVRYsNcGS/+8bnEtCYpbcMmRqlUAM8hRAgJYHusrFZe5+5Jmj3xisZDuK8JM+pGB90nTEZ
 ECBpOY/WvlmTDp7u7
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (markus.elfring[at]web.de)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.227.17.12 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jMzBs-00EdXq-JC
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid page count leak
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBJbiBiZWxvdyBlcnJvciBwYXRoLCB3ZSBtaXNzZWQgdG8gcmVsZWFzZSByZWZlcmVuY2UgY291
bnQgb2YgcGFnZXMKPiBpbiBjb21wcmVzc2VkIGNsdXN0ZXIsIGZpeCBpdC4KPiAtIGYyZnNfbXBh
Z2VfcmVhZHBhZ2VzKCkKPiAgLSBmMmZzX3JlYWRfbXVsdGlfcGFnZXMoKQoKSSBzdWdnZXN0IHRv
IGltcHJvdmUgdGhlIGNvbW1pdCBtZXNzYWdlLgoKV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0
YWcg4oCcRml4ZXPigJ0gdG8gdGhlIGNoYW5nZSBkZXNjcmlwdGlvbj8KClJlZ2FyZHMsCk1hcmt1
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
