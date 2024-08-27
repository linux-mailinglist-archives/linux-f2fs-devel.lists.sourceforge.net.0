Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BFC9600F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2024 07:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sioW8-0007vL-NL;
	Tue, 27 Aug 2024 05:13:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sioVv-0007v4-Ui
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 05:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cCXqZUrSYsLJrkst+rIGuVs2OORkCo1hPStex7N5M18=; b=EuMWDsZLgkWd8I6p3ExtTub8ZS
 p0PZ3rvm+s0TMWzDXbGlgSl2ebkRHAKHTaoJyirGUnpm4CsCoJaaBTcEjIenpzK+x0GSvYVv/ihf7
 yt1p9K8b0F92lo2q08hi6JLPmYpSqK4/O/+Eei8JeDUodG02MozvTBIa62Fba5wx7gXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cCXqZUrSYsLJrkst+rIGuVs2OORkCo1hPStex7N5M18=; b=AoHvntA9QieMvOUR4AJlLzDqoA
 5OeN2rldP8uRw5kdGDG2no41Oe6si2+0UGXZ6tdvzcVjSyVbz3k6XkrlLfZ41bhKoy07Z5whYG0QB
 GiVuNhm2qhdwJOGzjK25TzScibaYs/Ov/o5FlWNTifzsTkt7pKGFtcAl7kzsTRqFPi9Q=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sioVt-0001RR-Ph for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 05:13:07 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240827051252epoutp01a5b6ef512b0e49368d0d069e5f14913f~vfd2QaBnF0567405674epoutp01c
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Aug 2024 05:12:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240827051252epoutp01a5b6ef512b0e49368d0d069e5f14913f~vfd2QaBnF0567405674epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724735572;
 bh=cCXqZUrSYsLJrkst+rIGuVs2OORkCo1hPStex7N5M18=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=qyBfu9L8Jb6Uq6h5L7wRuie/68Jw3AJiXm+A1qgHdl/xrmoGf/MS4dkHIYw07Dav3
 FoJL/buNyWe5XBQ4h0oOdCRq6lR8PMBtnXYnS+dNgvaaI99aTm5gvYQccAJUH+q1fZ
 2RsWgidvKMrOByzOPyRYfdtXmLvQ/CX0GtDUrs4U=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20240827051252epcas5p260600137502baffea787d2207b444333~vfd1tcJNa2626726267epcas5p27;
 Tue, 27 Aug 2024 05:12:52 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.177]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4WtFzk37Szz4x9Pw; Tue, 27 Aug
 2024 05:12:50 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 71.DD.19863.2506DC66; Tue, 27 Aug 2024 14:12:50 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20240827051249epcas5p4dd527b84dd1ee5911cf84ad60132ea6a~vfdzdXQka1975319753epcas5p4q;
 Tue, 27 Aug 2024 05:12:49 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240827051249epsmtrp28959f7cbc47750675b06141c7b1eff23~vfdzccABd1630916309epsmtrp2v;
 Tue, 27 Aug 2024 05:12:49 +0000 (GMT)
X-AuditID: b6c32a50-ef5fe70000004d97-ac-66cd60521094
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 8D.CE.19367.1506DC66; Tue, 27 Aug 2024 14:12:49 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240827051246epsmtip20a7e5909dff1f6550d059cc6769d7e3a~vfdwCkoxU0710507105epsmtip2l;
 Tue, 27 Aug 2024 05:12:46 +0000 (GMT)
Message-ID: <3884220d-e553-a1c2-f636-0ff95500e8f5@samsung.com>
Date: Tue, 27 Aug 2024 10:42:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, axboe@kernel.dk,
 kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, brauner@kernel.org, jack@suse.cz,
 jaegeuk@kernel.org, jlayton@kernel.org, chuck.lever@oracle.com
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <d0e017ac-8367-4bb8-9b7f-d72dd068fdb1@acm.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA01TaVBbZRT1Lbw8sKmvAYaP/MD4qghUKLEhPBBoHZj6nKIGS6czHUYayWOR
 kIQshXacmiqliwoVbKgBB6ZDG020lKUsDThM6EIqFcZAS+hiK4lUKNQSl2ETEx6t/Dv3u+fc
 89175+IIbx7j4wUKLaNWSOUkFoC290VGRr+793purMMQSFnuVGLUVN8sRBn+mEOo5TsTMOXs
 7YKpby2XYaq25hOYcjUZEaq5EqfGb3s41NxZM4eqst2AqJ6xTdTPp9+gunvsKFV/1s2hPr3Z
 iVGmq//C1LmpRyg1aKzjbAuiHcM76MG7zShtqLqG0Y7rOrrFfAyjWxs/oq0NHpi2OvUY/dg9
 htIVbWaIHmi4xKE9LWGSdXsKk/IZqYxRCxhFjlJWoMhLJnfszE7NjhPHCqOFCVQ8KVBIi5hk
 Mi1dEr29QO5tkhTsk8p13ieJVKMhN6ckqZU6LSPIV2q0ySSjkslVIlWMRlqk0SnyYhSMNlEY
 G/tqnJe4tzC/95AVUV3ASn9pXob10Cm/45A/DggRKP/egxyHAnAe0Q0Bo60DY4NZCNQYBpCn
 wd8jN5AnEuus249NdEFgpm1uJcEjpiEwdyjBh7lECqh72LbigRIvgQlHtR/7vgHYv3KhPhxM
 vA/mR+ogHw4kkkDzgnmlDkKEgDFXPewzCCJOwqB3sQz1BYjPYMrY4GXhOEZEgqFqnU/gT7wG
 ZsYHOKz4edAxXbfybUBU+4OlWg/q4wMiDQwsZ7EdBILJq20cFvOBZ6YHY3EhuPfrPZTFH4LO
 1orVIW0F+sVRP18ZxGvbdHEza7UefL7ggtnqXHC0nMeyXwB3q9yryhBw/1TjKqaBY96EsnOb
 gcBi2S3kBCQwrhmLcU37xjXdGP93boBQM8RnVJqiPCYnTiWMVjAlTzeeoyxqgVaOIErSCVnO
 L8XYIBiHbBDAETKIG+aw5/K4Mun+A4xama3WyRmNDYrzLugLhB+co/RekUKbLRQlxIrEYrEo
 YYtYSIZwpw5/LeMReVItU8gwKkb9RAfj/nw93JHWXJIYMa5/7s+/dq9vtU2038oOTbxYurui
 n+nv7SkN59zvT0+f29h1JnzLmzt/u7zrSH1nFma/Pf3D+V2ueL9niyucrxz90oYfNMSrLGe+
 ybAwg1GZS1bZZ8snQ8bdBeLMyQIyIuvjnEsdwwHGh6lN5ZUvLiA3u03FD7IM84qK9hJVSISk
 UW/O2PPOY9EQ98oJU+iPFtNoQEdKT59A1qrrtr9+2O4uPhY2Luh/eeO6f/p/mjJl/l476Try
 YOt3we9RBw6O8B8NhWuXVVbn4qzDEbr9Qr78rZL2a9vU+2rruiIrr2S4z6WWf7DJuSE1KQ6I
 RsW5+99mTj8TyK8ZlQx7nGUkqsmXCqMQtUb6H/KSClGNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsWy7bCSvG5gwtk0g+9P9SxW3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWcye3sxk8WT9LGaLjf0cFo/vfGa3+LlsFbvFpEPXGC32
 3tK2uLTI3WLP3pMsFvOXPWW36L6+g81i+fF/TBbrXr9nsTg/aw67g4jH5SveHufvbWTxmDbp
 FJvH5bOlHptWdbJ5bF5S77F7wWcmj903G9g8Pj69xeLRt2UVo8eZBUfYPT5vkgvgieKySUnN
 ySxLLdK3S+DKONC4m7lgK1vF/Y3/mRoYZ7B2MXJySAiYSOz+9BTI5uIQEtjOKNHceoYFIiEu
 0XztBzuELSyx8t9zdoii14wS5/69YARJ8ArYScx5swVsEouAqsTzy5NZIeKCEidnPgEbJCqQ
 JLHnfiMTiC0sYCOx8fcqZhCbGWjBrSfzmUCGighMZZJY+eIq2AZmgbeMEq0HjrBArHvHKPHg
 1Awgh4ODTUBT4sLkUpBuTgFriXePz7BDTDKT6NraxQhhy0tsfzuHeQKj0Cwkh8xCsnAWkpZZ
 SFoWMLKsYhRNLSjOTc9NLjDUK07MLS7NS9dLzs/dxAiOd62gHYzL1v/VO8TIxMF4iFGCg1lJ
 hFfu8sk0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzKOZ0pQgLpiSWp2ampBalFMFkmDk6pBqYF
 CyIWzAyWXHZs1Wsm65YE3izxZp5oPdUd+2YbP5SJX1x8XVr2dml0OH+vv6Nhc6PvTIWnP9/F
 Xo/KttjDvGaJuIn706aOfWtX+IWGZjc9+eSt8qyG46F0kVGawy62g7xsN4V9Jh0/dSeR7Yby
 w6zozxtOGPLJHzaZvX3N9+R9js7fe+JvuDs4KCgYWkzcqT+V936ko1yR8D+7hK6sB4qHFqXs
 cp6Q6BsuPs1lWbjM7MLY3jmPrBKyP0cf7XkQfl5hrWpwyzYdkfZ6/ZX7f5u780k6B+vf1b/e
 849PcsU8IeUNonENeZOZq8XXleVJqZ9MTlnUPv9puYTu41vPbPgeH3OuX63v3regXuGREktx
 RqKhFnNRcSIAzdpe72YDAAA=
X-CMS-MailID: 20240827051249epcas5p4dd527b84dd1ee5911cf84ad60132ea6a
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240826171413epcas5p3f62c2cc57b50d6df8fa66af5fe5996c5
References: <20240826170606.255718-1-joshi.k@samsung.com>
 <CGME20240826171413epcas5p3f62c2cc57b50d6df8fa66af5fe5996c5@epcas5p3.samsung.com>
 <20240826170606.255718-2-joshi.k@samsung.com>
 <d0e017ac-8367-4bb8-9b7f-d72dd068fdb1@acm.org>
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/26/2024 11:14 PM, Bart Van Assche wrote: > On 8/26/24
 10:06 AM, Kanchan Joshi wrote: >> Change i_write_hint (in inode), bi_write_hint
 (in bio) and write_hint >> (in request) to use u8 data-type r [...] 
 Content analysis details:   (-1.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sioVt-0001RR-Ph
Subject: Re: [f2fs-dev] [PATCH v4 1/5] fs, block: refactor enum rw_hint
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
Cc: vishak.g@samsung.com, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/26/2024 11:14 PM, Bart Van Assche wrote:
> On 8/26/24 10:06 AM, Kanchan Joshi wrote:
>> Change i_write_hint (in inode), bi_write_hint (in bio) and write_hint
>> (in request) to use u8 data-type rather than this enum.
> 
> That sounds fishy to me. Why to increase the size of this enum? Why to
> reduce the ability of the compiler to perform type checking? I think
> this needs to be motivated clearly in the patch description.

Since inode/bio/request stopped using this, the __packed annotation did 
not seem to serve much purpose. But sure, I can retain the size/checks 
on the renamed enum (rw_life_hint) too.

Motivation for keeping u8 in inode/bio/request is to represent another 
hint type. This is similar to ioprio where multiple io priority 
classes/values are expressed within an int type.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
