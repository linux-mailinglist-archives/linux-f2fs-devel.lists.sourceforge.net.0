Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A3E1DF03A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2020 21:54:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jcDkl-0007CX-2a; Fri, 22 May 2020 19:54:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Markus.Elfring@web.de>) id 1jcDkj-0007CQ-No
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 May 2020 19:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:From:Subject:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V9BPKljxEi3aUJ6So+yp2bw3usj0Mi6M18vsdXOJvEM=; b=lMjt2a6yK70nhhFITu5kYcyU00
 t7LqFSrYxwFgdCZjMloX3uGer3gpJN6YVxfyHcs6Tl/ypUqWBGWz5vPGTrCCT/8HdRNjiVXn60Gra
 I8nWMIoKvhpabwyBKCPTpYPYnsimIGSGOxhlmFR5U9i9K/GX967xhP25qDzEffMV/DkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V9BPKljxEi3aUJ6So+yp2bw3usj0Mi6M18vsdXOJvEM=; b=i
 lsLCsDOouaT9eQ3RcmdtKtqQzQJBk7fbrVJdFQNn1FqrcdtD5R7fF+FFPalMs9BtdSyOnIRlpcD6+
 ODMfXwArA44hFjcuzvYleZrAKF08i+BrSfqvvGrJfuKC+S9rW2xtkozSVv3wh598K6yKjrR4J/edi
 7gdDR9t6lxSQNsLU=;
Received: from mout.web.de ([217.72.192.78])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jcDke-005mBs-UO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 May 2020 19:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590177267;
 bh=V9BPKljxEi3aUJ6So+yp2bw3usj0Mi6M18vsdXOJvEM=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=QZaRpThHe+IcwTHfYJoyvEFUIqLhJk+ftpbmv5pjs+PGtIYz30GPIrOrnBE8dPLFD
 OpfEVk52AT4srnCSnHZ1aJApBsXQ/R+TXs7nWw3LQf003Tgz8ehV9T5C0O01mW+/iL
 Sh+mmjYm0ALWnGioWzObhg5mi9DY/XGLAPwOhj/Q=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.165.155]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lp760-1j8fkl0qiS-00eqYd; Fri, 22
 May 2020 21:54:27 +0200
To: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-f2fs-devel@lists.sourceforge.net
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <454ff32d-8be4-7fb3-2190-9d939b7600ec@web.de>
Date: Fri, 22 May 2020 21:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:+fxQghXK3hdr2ThLqIqB9PC+q93k4lQ9jGjB5v6TMmx0teS1VeB
 aDuoZyiy+9E12okQUQvke2i/td/qfziJhhk3E2rD0YzW2Qyx4jgJnASM+xdvVGpot5nM4UI
 Khm3f9V9JRrZNbirwpdXUbuVz945DOw+qVnnnz7Lj2ghR/tkCZSuPY8tHXLRDavnFTHh2P5
 kGKc9wlh+PH/wg/QzMxQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k8vlHDXPPzg=:0E48Ov2KmUIyJ1Ce0lxxQi
 6QD528lVC9xCt4Jw6FfouRdxHgrqMgqX8vIEuvs0dhEyVj+QQZYbVrYSl+gSfv9b9m4bBPCrJ
 UH7Ltcu6C9hyCr+cdb623KZ02uMYKRYseLC11kzm4xMPt528YDheS+t+p2C5nGpM0g+ZAZoWb
 xB0O0P7OKJ9I99fy0URRBqGwf5+k2yRbhb2MUMkrICT84XEVs/VtwmjpH4ffld5GJ47+sNKt1
 XzY/ULNuHxgYWoh/qcODz/4L2albS+pI6E8pQI3/L6moMHFPS0mOEOpQYiMKksk3QrqNaz92Z
 aqDxqxpDACEkGIZvXmFItUrbs1e+c5A1Jg1sgRIn+x+LSZta75pko1ts/CN1swVjOnFq+252V
 i/XYiPTeFdf9r43KUiYYkHhfCfQBiS5DpCpnoLBzELF7jmjuJPF+ghbDglSbCB7NroNKVc5NM
 kUi62IsO4HrfuTOdjiFCKf0oBvHrjB7Ds0Xu//KdgoQbhR27arJj9aRbPejgSwQDqJJ1AVq/7
 FF/yGBdDzuSuhaQjYCs/waL5v9EWduH0Y3Ol7fNoxrrN0z2snyXXgzbgME5pIBGFf6ZPLrstB
 nhYa6K7ueOM7/aA3k62JejYScvypkPu9JSKLvdfBcbkxOnKCf8vSRZ2fz89q5ZRYmtPLMaSAi
 NhJWfHFrrcLEgM66T6t8LgOnVhAG7lmYeo1wRoEq/PdmhyMJ/ZTdcIeV+AkPCLNN6Fe/DZhk1
 7w2+NA7JlNI7EOGLB9sz+LY63/8bRPGuFUsB6563J9K1iGbS8U8dThh2EUNqbGhZdamqtdni9
 hEeqK9MYRy8Q1rxsiwSdJgHvk8xn4sBpr845RWpC0nZI6G7yaVp2qsGXdtRmfko64ZU3c65/Y
 Y/ymsGpkAlQ/R4Ekq0+2BuDmuTporXpkiwlvphAmHmCFKURS9hikG4l8Qnc7ixVvwmboRmGBr
 +mIHRT3L2brbcV4Kt8jefoxvqEHoIOr40VKHr41aezDLeXTgvSL1OrSmCLuZH4OcAxxSK0Q7X
 4p7SPmoiV143HZpVXN7r/loch7ijOs49mdLnEIUR8whpGwtH//Hd9VJSYon0o5EwsRSZmZF8H
 cnlE6rjs3T7s011rljKlvuRzIzdH0HntQ59mKH9/Dg4xhoJxsNwhFEK+44wd+yfPu3M+vHzox
 uHHj+7oIMj56dFEspryegiRypZ9PCrSRImEA8GiXlQkJJG3IGFvBMwSjm8O+aMBJbYn5SV8vB
 NfoG0Q9V8h/67imsx
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (markus.elfring[at]web.de)
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [217.72.192.78 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jcDke-005mBs-UO
Subject: Re: [f2fs-dev] [PATCH] f2fs: Avoid infinite loop to wait for
 flushing node pages at cp_error
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBTaHV0ZG93biB0ZXN0IGlzIHNvbXRpbWUgaHVuZywgc2luY2UgZGlydHkgbm9kZSBwYWdlcyB3
ZXJlbid0IGZsdXNoZWQgb3V0Lgo+IExldCdzIGRyb3AgZGlydHkgcGFnZXMgYXQgdW1vdW50IGFm
dGVyIHNodXRkb3duLgoKSSBzdWdnZXN0IHRvIGltcHJvdmUgYWxzbyB0aGlzIGNvbW1pdCBtZXNz
YWdlLgoKKiBQbGVhc2UgYXZvaWQgdHlwb3MuCgoqIFdvdWxkIHlvdSBsaWtlIHRvIGFkZCB0aGUg
dGFnIOKAnEZpeGVz4oCdPwoKUmVnYXJkcywKTWFya3VzCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
