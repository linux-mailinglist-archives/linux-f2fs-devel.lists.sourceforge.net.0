Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B644797797E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Sep 2024 09:23:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sp0eA-0003JE-9P;
	Fri, 13 Sep 2024 07:23:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sp0e8-0003J6-67
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 07:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DfqqqIPcXuC33v4cLL0ODxpxiUkP1Rjz2JlXnKLXgh8=; b=mULC9PVChvcAY4ASOzylTbTm3w
 PAGQtD0iEmmk1GHBdezn52t/qufv35YkNvbnOnuVr4utN6bZGaxwvRjQ1F2IRo6KrJWRZoHANIHJP
 kR7kE3kFRxS8XthXSylIg8DU4ge4ozmmDjR9p3n+HrxG7d7IfCHJRuIqvmcy68Onkjew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DfqqqIPcXuC33v4cLL0ODxpxiUkP1Rjz2JlXnKLXgh8=; b=YbiU0Bg4psvVlLyziC1VXRiNK8
 viPI+jzUzFirUFwvwO1n20geIAk+9BE4l/cJhpeH2XQYYNq+H1tU97hxNJ0YNUYowjGgTNUHc+5Gp
 z/OjnTtt0q1oUUgGIuQPZLBTurEO+PteJGBrqO+Ap6s4idJk00kujjoua1rT4yt9Cjuo=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sp0e6-0002S1-N6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 07:23:12 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240913072258epoutp03849b6bfa1427ac6e17841236ea3a3b6b~0vNSnBXt33198231982epoutp03y
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Sep 2024 07:22:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240913072258epoutp03849b6bfa1427ac6e17841236ea3a3b6b~0vNSnBXt33198231982epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1726212178;
 bh=DfqqqIPcXuC33v4cLL0ODxpxiUkP1Rjz2JlXnKLXgh8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=oaUy9sBVP9dFId5l+KtVJaraEGn+CBmsqZSLSKhaCVPPx5yvvQX4XJSw7hVNzvwDC
 QgfRJ3PeRCHyi04mV0JpO9sUjDd5vXQg1ZuD1R28FC/hozRbnb2GHfRswdL84+Q2pC
 dZqepg0ezTPCzCQO6/6U6HD7356SIMccjvdIdBAY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20240913072258epcas5p397659184e19ff6cb4130a0130e08b500~0vNSDHDvv1522615226epcas5p3i;
 Fri, 13 Sep 2024 07:22:58 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4X4m401fQQz4x9Pt; Fri, 13 Sep
 2024 07:22:56 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F9.2C.09640.F48E3E66; Fri, 13 Sep 2024 16:22:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20240913072255epcas5p4ffa874219e563fd562003ce2c7ff0d3b~0vNPmRHie1203712037epcas5p4L;
 Fri, 13 Sep 2024 07:22:55 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240913072255epsmtrp23d9b77e732158615fd765343f8ffae55~0vNPlSX6H2729727297epsmtrp2B;
 Fri, 13 Sep 2024 07:22:55 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-ac-66e3e84f6c4b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.F5.19367.F48E3E66; Fri, 13 Sep 2024 16:22:55 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240913072252epsmtip2556522eb0be364036be534a4f076b144~0vNMvbd2G1221912219epsmtip2y;
 Fri, 13 Sep 2024 07:22:52 +0000 (GMT)
Message-ID: <ea71bdfd-f0f8-eb61-255d-68ea1e4421f1@samsung.com>
Date: Fri, 13 Sep 2024 12:52:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <fe2ae1b7-7c77-49e1-ace0-50e937f2c32c@acm.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfVDTdRzH+z1s+2HN+4US36hwruQEj4fVGF+SBzu9/JloXFJeHrF+sB8D
 B9tuD0KIMdJKtCaRqSyeMo5iEJxAAQLx7FrSAeKIB5koD1EICrs6EaI2RsR/r8/7Ps+f+xCY
 q47jQSTKNYxKTifx2RvwH9q9vX0jp8biA3K+wmDZyDk2nG6fR+CFBwsY/GfkNxQOttSjsLSs
 E4VfXjyJwvFKAwavnCPg2C0bBy6UGDkwp60fgU1DO+CNy3thY5MZh4UlExx49tc6NvzGtIzC
 iun7OOz+28SC3YY8zi43qu/mfqrbegWnLuT8zKb6ftFSVcYsNlVdnEE1FNlQqmFQx6bmJoZw
 Sl9jRKiuog4OZavypKrGZ9BI7hFZSAJDSxgVj5HHKSSJcmkof/8h8W5xoChA4CsIhkF8npxO
 ZkL5eyIifV9NTLKPy+cdo5O0dimSVqv5/mEhKoVWw/ASFGpNKJ9RSpKUQqWfmk5Wa+VSPzmj
 eVkQEPBioN3xXVlCZcEirizFUnXGDlyHmNEzCEEAUgha5u24gXAlGxDwSWc122nMI+CL+UZ0
 zfiu+PxaxP0BX6dej4DMPiPmNGYQMPZ9GecM4kJwyTDw541MzME4uQ30Wkswp/4kMOeO4w52
 I2PBI0se4uBNZAiob51d0THSHQyNF64U20xSYOjeQUd+jPwdAxcHpzgOnU16g57PtQ53F3In
 eLh8m+UM3QJqZ/JW+gHk1y7g0nDratN7wMlbfg4fQG4Cf5hqOE72ALbZJraTZWD07iju5HRQ
 V61nOTkc6JYGWI40mL1s5VV/Z6mN4NPF8dXsXHD6I1en91ZgzZlYjXQHdy4VrzIFes+bVnfb
 jILZ3stINsIzrFuKYd3whnXTGP6vXITgRuRpRqlOljLqQKVAzqSsXTtOkVyFrLyCz746ZGT0
 gV8bghJIGwIIjL+Zm8O+G+/KldDvpTEqhVilTWLUbUig/TqfYR5ucQr7L8k1YoEwOEAoEomE
 wS+JBHx37vSH+RJXUkprGBnDKBnVf3Eo4eKhQ2P+ahTNtaiieqLSk2NMjx8J/EkzkGcJr42e
 DI+OuxZVKpo1gyVz9PLDbT+Gpd5pfS1GX3P9xOnXT2x8x52FTQ4svLW9YK4gKP9Q5shxH4sy
 W6acTXuEHx47WpGyNyLCs7OVc6D55vNzp2K7dr6puP1GBjx7veDUrqv++/KtvWJLrde30vDh
 HeVia7rs404N1V/G2pKhbxnKLjfPpxUe3D53tC3og9yWw1621P7h56b0tJek+AW58Nn0V2zN
 FFHaEysKeltkgegTErfGXE6dbBBuja1KbMfwAc9yWbYp8dgzMzz92IGsx64pJqqZrnvyRSJ+
 8n3tU1lWaYfFerxiSZbCx9UJtMAHU6npfwE7LGK5kwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01ReUxScRzv997zvSdFvlDzl11GtZWVndpvZa7VqjdpdqyV3ZE8tIXKIJvd
 NmsVtTTaTJ+tzJIGNim1zJQO1JmU2SUViXZg2Ki0zM0OqYC1+d9nn+/n2r40LrIRofS2lB2c
 KkWqEJMC4kaNePSUZR3v5dNedwagYnsWiVw13wDK6fqBoz92J4Ze3a3EkL64DkP5ZzIx5DDy
 OLqWRaP3Ld0U+qEzUEhrtgJksk1CTwuXoGpTA4HO69opdPzFTRJdrndjqMTVSaCmvno/1MSf
 peYHs8+eS9im1msEm6O1kOyzxjS21HCMZMsuHWCrCroxtupVBsl+bbcR7MlyA2AfFtRSbHfp
 KLbU8RlbLlwniJZxim07OdXUmC2CJOO5X4RSj6dnGGqJDNCAaQBNQ2YW7Hw5RQMEtIipAFBv
 +Qk0wP8fHwIzrb2UDwdCvdtJ+UQuAE2NdZjnIGRiYM/Tg7gHE8x4+KRVh/v4IbAhz0F4cDCz
 FVa3HfTqA5loWHnvi5fH/xXYHOe9I4IYFto+xXnyceYjDvPcPO4ru4PB4o4jXhHJTISPT6d5
 vP7MXNjrbvPz5URBzXUN8OHRsOLzWTwbiPh+M/h+dXw/C9/PUgAIAwjmlOrkxOQE5fQItTRZ
 nZaSGJGQmlwKvO8PX3kT6Ix9EWaA0cAMII2Lg4Ra8p1cJJRJd+3mVKmbVWkKTm0Gw2lCHCIc
 qzgmEzGJ0h3cdo5Tcqr/V4z2D83AYnUj67c2tw6VPs9ds31pdqBrTmaXVrVl6aGeqLC4ztlF
 k39Zot4E7S0olI0Y5GweLGk9vLOyh4isuK341DdgdebCB4fipFeenCsJNxN8e85DAT/o7SIR
 sbYhZEKoY5+1pSz+5b3uo+4LRfnxF76Pepve1NGclDsxzCga4S+xXx7YFuk3Yea46LvfVjgW
 SuJjQIA29mdVpWv4kLLC8nVjalZoTTNUq5vl9quLx8nFa7J/0wtkWKzphIWs+WA9RdmH7XnU
 ksAOlSt0DHu4x5q3iS4zVos2dK0qcpbfH7AxVXnS2Z5+cU/S/sR5kYso6/qS3kt7iyR+YyKC
 0LtbdnljiW2jmFAnSaeH4yq19C9zlmoQbQMAAA==
X-CMS-MailID: 20240913072255epcas5p4ffa874219e563fd562003ce2c7ff0d3b
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51@epcas5p3.samsung.com>
 <20240910150200.6589-2-joshi.k@samsung.com> <20240912125347.GA28068@lst.de>
 <0baddb91-b292-db90-8110-37fa5a19af01@samsung.com>
 <fe2ae1b7-7c77-49e1-ace0-50e937f2c32c@acm.org>
X-Spam-Score: -4.2 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/13/2024 2:00 AM, Bart Van Assche wrote: > On 9/12/24
 8:50 AM, Kanchan Joshi wrote: >> Wherever hint is being used in generic way,
 u8 data type is being used. > > Has it been considered to introdu [...] 
 Content analysis details:   (-4.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sp0e6-0002S1-N6
Subject: Re: [f2fs-dev] [PATCH v5 1/5] fs, block: refactor enum rw_hint
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, sagi@grimberg.me, martin.petersen@oracle.com,
 gost.dev@samsung.com, jlayton@kernel.org, vishak.g@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 chuck.lever@oracle.com, javier.gonz@samsung.com, viro@zeniv.linux.org.uk,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/13/2024 2:00 AM, Bart Van Assche wrote:
> On 9/12/24 8:50 AM, Kanchan Joshi wrote:
>> Wherever hint is being used in generic way, u8 data type is being used.
> 
> Has it been considered to introduce a new union and to use that as the
> type of 'hint' instead of 'u8'?
> 

Is it same as your other question in patch 3?. I commented there.
If not, can you expand on what you prefer (maybe with a code fragment).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
