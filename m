Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD39A24E91
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  2 Feb 2025 15:21:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1teaqB-0007j5-GX;
	Sun, 02 Feb 2025 14:20:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Markus.Elfring@web.de>) id 1teaqA-0007iy-8l
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Feb 2025 14:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RbPhGJwF4Wwp0v+AfTksRjJ9Zp8pwdmy39xWhzS1nDw=; b=JWOf9ILpdZp1JKVkM2j5d4xAc8
 gXmvd4BaCaEaSHy832outNrAGxqumpNiQHoLd01rGCcWyEH1ZpbX6Puh6PoG5IRDrG+udF9AL9O/U
 DqptDZXc451/4s8FESGjytRfFrqKD+ugqodWhGNK3D0VE/qneoTa7mezX7znxeXh4jJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RbPhGJwF4Wwp0v+AfTksRjJ9Zp8pwdmy39xWhzS1nDw=; b=ioW7SbdLsiZH2Eim5medJ8h9AI
 HHeTOaoSRXmcYJ+WuIIYJ8oeeRGFXLvYipFXM/g1VxgePlD2Gv0SwJ9P8W0HSXYEHNOcF13LkL2pu
 PoqORqj2mk1VAg0oV6KJd7is1THeIebiVXvfQo3hCO2tZl10beKZot1+nts0mBemXWpU=;
Received: from mout.web.de ([212.227.17.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1teaq8-0007AY-Gl for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Feb 2025 14:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1738506016; x=1739110816; i=markus.elfring@web.de;
 bh=RbPhGJwF4Wwp0v+AfTksRjJ9Zp8pwdmy39xWhzS1nDw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XJc3gy0x1oHz7xgkOPrcixE1/DjP+DBSL3v6MpeeAUrNCgZddpBvufSiZoZ2XesI
 oaTAa7yAWM3Y3JJ2FmsGm9IMpC2jeGBrpCsv/iE4XNoh9zfAV18TtpGqTWKmZHJ7u
 xBde3U3rW8Fqh+uHDtrEG9fJsScCJar9Q9hORbBbJ9HgQrEcoiUwFiqLb+p1IDscR
 ymhdeDx9SJIuncX6yVcA5fYN5LhHhjnuYZPeNLjglXMPJ2eHcFFMMcVdeN+3ouo9A
 fhMcTGW5xtploLg4kqBIurlAJTEjHraFYvh725vkZj85ctYW1ia6TURxAJJu4Ycmw
 kQrKKdnIw8M9BzcZ2w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.26]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOQy-1towig0MKg-00PzWo; Sun, 02
 Feb 2025 15:20:16 +0100
Message-ID: <882d065c-f225-4cab-87e5-3b31e26430da@web.de>
Date: Sun, 2 Feb 2025 15:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kohei Enju <enjuk@amazon.com>, linux-f2fs-devel@lists.sourceforge.net,
 Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250202043253.64389-1-enjuk@amazon.com>
Content-Language: en-GB
In-Reply-To: <20250202043253.64389-1-enjuk@amazon.com>
X-Provags-ID: V03:K1:FzmkixICOcVvhFg4/ubSrQK7qkxW/j3w039Ad0hBoGosCJ1WBhj
 LG+BtswMBtPcWHd16jbk0s2gcccj7hLmin5Nbc2c4EcOemvLptDufATgMyVVk7FCRbjMkn4
 AXXpk0NTj5PUJD1nFYAZ+O91Ow9+1gUlbh5sSnkd3ON9nVuYztUinOQzaLnmH6qXkDzVrd1
 Qw+Ti6Epa7m0Xo+oKjfcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L5zLA/ikus8=;rzUB+AM7NwFxRy/JXF04ufXYdhC
 VA9jLQb344SQcaCdTLW5IoShouyxYSeXGf+09ywauzhTIS08xeG7pmEYiMM7BM+L9uhXUXz1s
 yeILzVwWZiP9/zBxcPm6vDP/5f6AsMJWbkZK3Dnv3Yj3hRS+VxSlBbWuSRqWj8uWNjj05AcIL
 mw0Tj4QbXUP28Qa0Vh0h6HUVH+B4QWjRNaE+mQXjl98ILyFf3v6M4JuoEV1GtzhUvsuiJrWzb
 VJDOQ4IMvcBIZLJOqrnmuCW0gzeQtTCs9ELVr8BO8/2iFCoq6Qch9wnQk6Tj7/DMuqu6HFTMb
 9UAjkBnwQJ9GLWbL9vd9/zUX6Tlw2AJPb8vFsH9EsjoPsint/WzKgqyL98+PLm4suHZMU3z3j
 ZkVlJlCc1bZyoD0d1gHYTikp5apq1X1m2bkcYbyyHS/4vFDM7nXcDVoAMjFHp+JlrzEM+jq8J
 o6PGsBNAQMP7dWBMDxZk/v+2KL4fMI8l3CWFMjTrIJfp8UouPbDlrzBPqeAnRDGhXjqrKtwzg
 VK8lUxxysMhVnpnVWjChE8IHEZ/82c/a5whp+8YCkcYif0MN4ruv7PGiHIDz3lq8QkSe6rcUJ
 rK+PZw7LAMCNIm4s8GmfgJfZOxJwzoLyRJp2kw18PvCxWy+cUbJe1ecRvNd4Dz+ufdFtSOSRB
 kImEKYc8y2vj/AvxzSrBIfYouGEIwFq++ws36XliVK6bGeI0ySNys/YB83MNbY0i2XhZJ3joE
 wy+2bE2Lgy9MK91AdORj6jszdrTOxxk/Uh8Il3OREYcGsx71lri5lOde+Mhd6vvLUuZieZQ+H
 A3cVE2npTdxgA7cPiWjjgxFq3ELKy0AZvyLLaWAD2YATXQf1nrEyMOqaMmDIlYSDxhx9xWcXl
 7me/LRcvl1Hyn/Ea3xfYX1qfXkxQ7SS4+dueGlhr5OuZlWtroaKSY3JPlKa9g9ZVJRPVySj1k
 iuMv5goOMCgIaDwv44bIopDEhBVvXiyIg6Yl002nQWwD432dMlPxZ3hnufvleGYriTd4EELZX
 ZPbMPFkidi4xwD1VZtP+wyxwOpY8rbU9m88CVrep6p/0m49p1IoTawZOaC/quluue+MOt9jGx
 luhdP+iatA0P/1Eaop2iJ+Z2gn10742BP771V30QTJuAXIvq1UQk/3B/ymafhLgDIvQ9pyeXw
 cREevGKveYq/kKa+1rFed/2wPrL6gLNrT8JxgkCbD8YKx8O4qswtNBBzQ/enEMswxK5bHP3zM
 jVGPlQ/Un94kI+p4WxdwSYdyqTCHEyElpYa2HW/sgn0CLTGxPVo/X3TYPEqVOWFocPc7eY1ku
 1/q+bzFRHsNociGGY0Ym8JRO662cGZKScrEr1tDXZYZPZL20ZHEzhn3aJzs/9GWn3MC
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  … > f2fs_bio_alloc() with bio_alloc_bioset(), but null checking
    after > bio_alloc_bioset() was still left. See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.13#n94
    
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.12 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.12 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [212.227.17.12 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.17.12 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [markus.elfring[at]web.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1teaq8-0007AY-Gl
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unnecessary null checking
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
From: Markus Elfring via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Markus Elfring <Markus.Elfring@web.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 LKML <linux-kernel@vger.kernel.org>, Kohei Enju <kohei.enju@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

4oCmCj4gZjJmc19iaW9fYWxsb2MoKSB3aXRoIGJpb19hbGxvY19iaW9zZXQoKSwgYnV0IG51bGwg
Y2hlY2tpbmcgYWZ0ZXIKPiBiaW9fYWxsb2NfYmlvc2V0KCkgd2FzIHN0aWxsIGxlZnQuCgpTZWUg
YWxzbzoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0
Y2hlcy5yc3Q/aD12Ni4xMyNuOTQKClJlZ2FyZHMsCk1hcmt1cwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
