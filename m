Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 660881BA179
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2020 12:38:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jT19z-0003TT-Gd; Mon, 27 Apr 2020 10:38:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Markus.Elfring@web.de>) id 1jT19y-0003TL-2n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 10:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:From:Subject:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=woZ/2CyQJdO+sZ77S3XgZwoofyUa1t3wQRHp1c/DWEg=; b=FmI+zd9zcx5UgIISGWxylhKX+F
 Zo9rRp7486D+2AcEY/SizZCp904gqKp1+VGtmATLNpNnmL3htTzUKVKGYDl/mIhYPXaGWTRUrOIY3
 ShlnwhLrpqG/J79GPcSdx1AI42wLhRhDSmJotNhmjq+owqAhJqgZuWIiwCoPr/4JFZ20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=woZ/2CyQJdO+sZ77S3XgZwoofyUa1t3wQRHp1c/DWEg=; b=R
 6Fozm/ftBtkujkC6eLN2b40UQV88kdN8D81eRoTm61tC2+Kn+RcBcTBFSF5bVkupsvaEpFgo8KrlL
 amGHYMslEBNlFXGQkficTNauPSiNLg97a9lxPswYyh3vXtIY+yEGeFnVVvTY0RW1M+OYpcCmpzZhh
 adFlBjWo9j7BpztM=;
Received: from mout.web.de ([212.227.17.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jT19u-00HOHs-4u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 10:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587983904;
 bh=woZ/2CyQJdO+sZ77S3XgZwoofyUa1t3wQRHp1c/DWEg=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=JCHUpYFd+nAVdchgNmdwp8lVIT5WXOFwl17pTEAoPlFSjrV9swBjpWOF3m04GPE5E
 LnEKxIDq89gqy3Eg9WC17KWO6bL/BQf9Le3ROw0nS+sM0fZSnyUUM2X/STaUaRwvA6
 4AbcHNHyzDVhxs6UKXZNx+YH185k++jWwb9Cih3A=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.190.48]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Le4Lg-1iqKsu2aoW-00puSo; Mon, 27
 Apr 2020 12:38:24 +0200
To: Sayali Lokhande <sayalil@codeaurora.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <07a820a2-b3b3-32ca-75ce-ceaca106d2c6@web.de>
Date: Mon, 27 Apr 2020 12:38:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:++/Oc5KfkHwauMmC/4Wo1AxKxEs6Q9CoodqX2ixa/jol188TefC
 a2CZdNSc7sKz4v38wKY+WextH9VZpFAAY378DQeaI/gHEJGrTnZ5OG1rHLLXxsREAl0nRsF
 iTg7lfily2eryNJZ97qqMmRu29ri1oRZZaGtIXnrMZr+wHPKrgwqR8nKgnJyf5uWC/KKKfg
 x5/TgR02PQaG+DuRYHa8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cxhf14tGBdE=:JfaUdP9YQJOeuT6d+qHLHu
 ikGONHg/ZjR90X4HWPHvVLTuNrJoXjtEfsDnFTldOwuxqrmruX94F7vr7F+sJI4qHjIortKcQ
 KD5oRTV+fn/MQDtSFX/EiAdbfKzAss7f7vCvS+9IQDUn8RMMy3aDrMYOjGRfGAZilSwLQkRar
 2lzwqgNgELZDXleA/sKq76EynInym9nM56GCsWfaE3Viv0hISj/f6rn9VvXJiC6sH0YEY3E0H
 Hr79qECXrRhmcNBInmN85ockdTuPix18Kn2cpuZHJ4A/sGyz1YxabAPP3rnB1ZZ2FJc1AC6KE
 BZDTjm0LT8bjMOoAtrf5/OxA2U+kIfz9OaP8OaUl+eQsYQjMTGu1bJmbt9gVDdhoSKAYvJVme
 IjYzPajVXWRIi5uHf5sOFXkM1pinhCDhyzl+npQL1h+qVhXCqiok7c2uc4O9N99Ug0TiuyTxg
 itI8BEgRRjVtedZRY9HfkRozaNuvPB1JXm9DTvL/Bm1VO8nR1mtr2yjpESbW/KPbY+y7MnyBV
 3lBJ74O6UOTz/eyDI85bBPyw45sMTZ7dELozm8t7mf6iJnTq5L4ocnuoiU1mKsXgWEDaqWDLJ
 KmFFHxuf3uVrfEsbTwGlxVh+sMX/jBmPG2ZqsMfUQM5iPW31lrFHcUxBGWTIpjvbDPlOTTw++
 GJF5J+c5YP4zyck2qioaSL5x00ckHsqqcxE6UqGgs1fE4heImCrIA5GzZXyyzlZU7LwiWXrhH
 6zGBgFikNd9MYPLr26URsMhCoFXxSfVrkXy6mIgEA+b+kXO0rnnD9qd4GeICuPDFlldahPnR2
 i76QZQfWu9m5j+lsPS5cbdQFdVPwAXCP5ElEndghTBN64PUsNp5PXD/iHnCP+VKvdmJ2XYZZH
 JTAahS3CsKVqeJ3kwJc06i3hVd9oaOqa4WtE3z4QE+tjdCP6VuStdocnpinHCcQ0gzZFpx7yA
 dRjbIs0mpx0CF0AGcHBCnVD81TnqMDvW2p76JTw6gd3qnxFf8vBYp3012Paz6I9M3NXX6oqUv
 kO7is79PRs0bevWVu7UKkkCpWl3t6A8CuNKcLqw12CW07MEL3AsytVUCluAiNobPw4ykL3g3N
 CwAXSmzKMTsDocDi3l8JUOrxZlGj7sDJrIW0kfGNzG9P/HjT6WYouKVuxr6GdLH/2YhMc4h37
 M3H91Xb3+O/PhyPRK7hKBGAn7l8aV/qZ6lLQA6TVDK7OqbEa1qs63d/Jeaj50pQPBZWayksP+
 uC4GsorXEuE9jLEhl
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (markus.elfring[at]web.de)
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.227.17.11 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jT19u-00HOHs-4u
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: Avoid double lock for cp_rwsem
 during checkpoint
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiDigKYgVGhpcyByZXN1bHRzIGluIGRlYWRsb2NrIGFzCj4gaXB1dCgpIHRyaWVzIHRvIGhvbGQg
Y3BfcndzZW0sIHdoaWNoIGlzIGFscmVhZHkgaGVsZCBhdCB0aGUKPiBiZWdpbm5pbmcgYnkgY2hl
Y2twb2ludC0+YmxvY2tfb3BlcmF0aW9ucygpLgoKV2lsbCBhbm90aGVyIGltcGVyYXRpdmUgd29y
ZGluZyBiZWNvbWUgaGVscGZ1bCBiZXNpZGVzIHRoZSBwcm92aWRlZCBpbmZvcm1hdGlvbgpmb3Ig
dGhpcyBjaGFuZ2UgZGVzY3JpcHRpb24/Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJv
Y2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2lkPTZhOGI1NWVkNDA1NmVhNTU1OWViZTRmNmE0
YjI0N2Y2Mjc4NzBkNGMjbjE1MQoKV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCcRml4
ZXPigJ0gYmVjYXVzZSBvZiBhZGp1c3RtZW50cwpmb3IgdGhlIGRhdGEgc3luY2hyb25pc2F0aW9u
PwoKUmVnYXJkcywKTWFya3VzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
