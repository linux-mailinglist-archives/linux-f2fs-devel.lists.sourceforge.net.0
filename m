Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9A977937
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Sep 2024 09:16:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sp0XC-0001fF-4h;
	Fri, 13 Sep 2024 07:16:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sp0XA-0001Ye-O7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 07:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3zqtpJE/mdk5d0QMfgH8EkNrmbkSOpNb4bGq/RkfojY=; b=UVUWr7Vb8lOVAONh+8uLFF1hfX
 oDVIi1nepf+c0O8KLM9YGJenuPvJ9VFP8tOD/xFjoY0gy5ACMs5FIj0KV8oEa9TaOfzUnS5jvcy+i
 UrsO28p8V0WVNTg4lkLvZ1pC/AO+XDejG0HdGb6gFig1qAt62JctNyk7fxE4a1832vvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3zqtpJE/mdk5d0QMfgH8EkNrmbkSOpNb4bGq/RkfojY=; b=jIVloy0igz8PGI2ukKhkJAo6F4
 82l/CuwWeSmfw+etGqP8E2kPesspzA0TRu+57gdqcxU4MP25rYquzL+eiKVxBJQ0f92KOTKl+R2zv
 w/Tlti7JekR+ljVvYtpqa5ATHdXNyQUFtd31YvPhQ4m6E8zohD+shiWmG37WXzzDi2tA=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sp0XA-0002AF-2f for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 07:16:01 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240913071552epoutp04981b49031ab5bb668f200e05921eb288~0vHF20-Zq1171411714epoutp04_
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Sep 2024 07:15:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240913071552epoutp04981b49031ab5bb668f200e05921eb288~0vHF20-Zq1171411714epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1726211752;
 bh=3zqtpJE/mdk5d0QMfgH8EkNrmbkSOpNb4bGq/RkfojY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ORtlmQjVsW2YhXgfkmG/5bxOhjsKBtoesB9TnM9kkrMggSgzuuk5thhsWSXwKcY35
 VzH/pen3oMAEEogfXtS5X2UUN69eHuG3IQfaBtO6okL9E4pPUYr1qKo9Bm1S9llSP/
 6NqsaFlQ/cTCVDZ3qDh//ErbKg3CYy3BWygw7ZUs=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20240913071552epcas5p407bc7471dba9c401717e052479b00d1a~0vHFg4og41690216902epcas5p41;
 Fri, 13 Sep 2024 07:15:52 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.180]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4X4lvq1M23z4x9Ps; Fri, 13 Sep
 2024 07:15:51 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 62.03.19863.7A6E3E66; Fri, 13 Sep 2024 16:15:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20240913071550epcas5p105ccc2bbc82283e49e07d5dff05020b0~0vHEENaJk1486314863epcas5p1j;
 Fri, 13 Sep 2024 07:15:50 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240913071550epsmtrp1178989a849662704336e4812401c84a6~0vHEDG6WC1969919699epsmtrp1W;
 Fri, 13 Sep 2024 07:15:50 +0000 (GMT)
X-AuditID: b6c32a50-ef5fe70000004d97-dd-66e3e6a77a65
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 49.15.19367.6A6E3E66; Fri, 13 Sep 2024 16:15:50 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240913071547epsmtip1be43924e78b5b0a33230ca2b73f0bf33~0vHBFfCZz3168031680epsmtip1q;
 Fri, 13 Sep 2024 07:15:47 +0000 (GMT)
Message-ID: <19f3205e-ba37-0541-f8ac-4e0fc8fcee87@samsung.com>
Date: Fri, 13 Sep 2024 12:45:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, axboe@kernel.dk,
 kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, brauner@kernel.org,
 viro@zeniv.linux.org.uk, jack@suse.cz, jaegeuk@kernel.org,
 jlayton@kernel.org, chuck.lever@oracle.com
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <53043e99-be5f-4fc6-be87-4ebcb8ce99b6@acm.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xbVRTHfe+V1wdSfStj3HQG6jObDAa0E+qF8WPJ2HwRTJjoHxInPumD
 kpa26Y+xmRIJBJSp4CoO7BgwJEAh4UdBws+IZYZNIF1gbkIANyglo5AJmExEmC1lk/8+59zz
 vd9z7sklMH4JV0BkK3WsRskoKNyH0z18LCSs0bGQKRpa8YIts2U4dA6vI/Dqn5sYfDq7hMKp
 oV4Umlt+QeG1ikIU2ttMGOwoI+DCzAYXbjY0c6HReg+Bg9OhcKLuLTgweJsDaxoWufDL+z04
 bBzZQWH3Vg0GW52POdC2PeIFbaYq7qlD9OTdJNo218Ghrxp/xenJcT1taS7B6c76z+j+2g2U
 7p/Kx+m1xWkOXdrVjNBjtTe59IYlkLbYV9EUXpo8VsYyUlYjZJUZKmm2MiuOSkpNP50eJRGJ
 w8TR8E1KqGRy2DgqMTkl7Gy2wjUzJbzAKPSuVAqj1VIR8bEalV7HCmUqrS6OYtVShTpSHa5l
 crR6ZVa4ktXFiEWiE1Guwo/lss2qakxtOXCxoXvAKx9p4l1GvAlARoKaQSNyGfEh+OQAAlpn
 nnI9wToCClds2PNgsWAYeSb57ucV1HPQi4D6sbo9/SoCRueWMHcVj4wHtpkq1M0c8ggYnzfj
 nvwBcPt7O8fN/uQn4J/fqnZv9SPjwI3tJq6bMTIATNtrdrUHyXYUTBT5uA0wshwFf1daXQYE
 gZPHwJ1v9e4ab/Ik+MnRgXu0QaDwx2u7bQOy0RsMdK2jnrYTQXHfENfDfmB5pGuPBeBRWfEe
 y8GD+QccDxtAT2epl4cTQP6/v3u5fTGXb1tfhMfrJfD1lh11pwHJA18U8z3Vr4I54+KeMgA8
 rKzfYxpMl9/dbZNPLiOg+dHRbxChad+rmPZNb9o3jel/41qE04wIWLU2J4vNiFKLw5Rs7vON
 Z6hyLMjunwhJ6UFa2rfDrQhKIFYEEBh1kGfE5zP5PClz6VNWo0rX6BWs1opEufZzBRP4Z6hc
 n0qpSxdHRosiJRJJZPQbEjEVwHMWXZfyySxGx8pZVs1qnulQwluQjwp1RUV3Lt5iE6IHE62K
 98+Mhppnix76+/W+LNOwwYZzH2EZt1KPRztr8/A+Y+6Rw7phUUROtSPoftIVH19DY+YfT8aO
 RggFjC6NsoTcKxdICj+/cMY+er7aqmiSZYev2sYzidHYQEfYYY5E65TnfTVxKfOGfPL4277v
 GCqkQsNW6an+usQfkoNK+z5QhMhLXlxjix1M8qaS2xaDC6D5vcfXJWvtAXmnO1UNxFmnrZ8x
 fDgaPDSWMPVC4F+doa9Ta+fOR7WmVqIV1nfHJyfKIibMhwqSHB2vccxbg/xK37TTJ+KXCm4+
 GRqWru5sJZ98JSZ4LCg7d2ehdhl2mcZrKI5WxohDMI2W+Q+MMFVlnAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO+fs7GgMjjPz6x4TIxM1JeyjUqKiDhUV3a/Y1OMy51xbywqi
 lRW5Loqa1tGcpcym5GW5qamUlxJHsrykKWqoU0MtKymV0NVcgf+e931u74+XwoW9xGIqUnae
 VcjEUhHpTJhqRct9dIP9EWvNJR4ovzuBRCO1PwBK/TaFI1v3EIY6XpdjSJ//BkPpaXEYshZy
 OCpOoFB/1zgfTeny+Cippg2gqk5v1Px0B6qsaiCQVjfAR3fay0iUWz+DIdNvLY4KRsYIZJmu
 5yELl8HfvJBpad3FWHqKCSY1yUwyLY0qxpAXTzIvcq4yFVnjGFPRoSaZ7wOdBHO/JA8w77Lq
 +My4YTljsH7B9gmOO28KZ6WRF1iFX/Bp5zNTGZm43OByUWeq5KnBM4EGOFGQXgcfVI9iGuBM
 CelSAHNmynEH4Q7j2ib5DuwK9TNDfIdoBMDkni7STgjoYGjpysDsmKA9YWOf/t/eBTY8shJ2
 7EaHwspP12Y1rnQQfDL9bDYU/1vQadXO7hfQRRicbF5pL8DpFAyO3Bj71zYMYLo58e9AUSTt
 Bd8nq+wGJ3ojfDVYTDqCAqHGqAEOvALGGdPxRCDk5tzBzenj5li4OZYsQOQBN1aujJZEh8n9
 fZXiaKVKJvENi4k2gNkvWLO/DOgKp31rAEaBGgApXLRAkET2RQgF4eJLl1lFTIhCJWWVNWAJ
 RYjcBR7S+HAhLRGfZ6NYVs4q/rMY5bRYjXlfv+4nVdUZj028m/5q+rx9p+Q37eLzy/OQzZLc
 5ttwGNcdPHry6t269QMfOz9fkfO0H/X9r0cFyzCbrEp7bnPznu+8oMl7sLepaT4vzctb/rOL
 G7zSvWXD1+bYwFhzQW2f9UGtWh864cUTWRM8Yqc+7VXdydrIe9su+5BqdC048jiqY3dfC3O5
 qPdWSV117s3qbQGaipbKH8EB8yX97W/ygzJPrPZ8OFBifhySOJHNXfSf57HM1KReui1txyLz
 vvZfN75k25rGYlaNP/WxoSXD7n5jpYk7h1uvZdbnjBaJzSk9k/TEgSdFxSZj/K3bZ5/fOyUH
 5WnVloiXdzls61BhiohQnhH7r8EVSvEffHF713QDAAA=
X-CMS-MailID: 20240913071550epcas5p105ccc2bbc82283e49e07d5dff05020b0
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151052epcas5p48b20962753b1e3171daf98f050d0b5af
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151052epcas5p48b20962753b1e3171daf98f050d0b5af@epcas5p4.samsung.com>
 <20240910150200.6589-4-joshi.k@samsung.com>
 <53043e99-be5f-4fc6-be87-4ebcb8ce99b6@acm.org>
X-Spam-Score: -4.2 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/13/2024 2:06 AM, Bart Van Assche wrote: > On 9/10/24
 8:01 AM,
 Kanchan Joshi wrote: >> diff --git a/include/linux/rw_hint.h
 b/include/linux/rw_hint.h
 >> index b9942f5f13d3..ff708a75e2f6 100644 >> [...] 
 Content analysis details:   (-4.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sp0XA-0002AF-2f
Subject: Re: [f2fs-dev] [PATCH v5 3/5] fcntl: add F_{SET/GET}_RW_HINT_EX
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
 javier.gonz@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOS8xMy8yMDI0IDI6MDYgQU0sIEJhcnQgVmFuIEFzc2NoZSB3cm90ZToKPiBPbiA5LzEwLzI0
IDg6MDEgQU0sIEthbmNoYW4gSm9zaGkgd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3J3X2hpbnQuaCBiL2luY2x1ZGUvbGludXgvcndfaGludC5oCj4+IGluZGV4IGI5OTQyZjVm
MTNkMy4uZmY3MDhhNzVlMmY2IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3J3X2hpbnQu
aAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3J3X2hpbnQuaAo+PiBAQCAtMjEsNCArMjEsMTcgQEAg
ZW51bSByd19saWZldGltZV9oaW50IHsKPj4gwqAgc3RhdGljX2Fzc2VydChzaXplb2YoZW51bSBy
d19saWZldGltZV9oaW50KSA9PSAxKTsKPj4gwqAgI2VuZGlmCj4+ICsjZGVmaW5lIFdSSVRFX0hJ
TlRfVFlQRV9CSVTCoMKgwqAgQklUKDcpCj4+ICsjZGVmaW5lIFdSSVRFX0hJTlRfVkFMX01BU0vC
oMKgwqAgKFdSSVRFX0hJTlRfVFlQRV9CSVQgLSAxKQo+PiArI2RlZmluZSBXUklURV9ISU5UX1RZ
UEUoaCnCoMKgwqAgKCgoaCkgJiBXUklURV9ISU5UX1RZUEVfQklUKSA/IFwKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUWVBFX1JXX1BMQUNFTUVOVF9ISU5UIDogVFlQRV9SV19M
SUZFVElNRV9ISU5UKQo+PiArI2RlZmluZSBXUklURV9ISU5UX1ZBTChoKcKgwqDCoCAoKGgpICYg
V1JJVEVfSElOVF9WQUxfTUFTSykKPj4gKwo+PiArI2RlZmluZSBXUklURV9QTEFDRU1FTlRfSElO
VChoKcKgwqDCoCAoKChoKSAmIFdSSVRFX0hJTlRfVFlQRV9CSVQpID8gXAo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgV1JJVEVfSElOVF9WQUwoaCkgOiAwKQo+PiArI2RlZmlu
ZSBXUklURV9MSUZFVElNRV9ISU5UKGgpwqDCoMKgICgoKGgpICYgV1JJVEVfSElOVF9UWVBFX0JJ
VCkgPyBcCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwIDogV1JJVEVfSElO
VF9WQUwoaCkpCj4+ICsKPj4gKyNkZWZpbmUgUExBQ0VNRU5UX0hJTlRfVFlQRcKgwqDCoCBXUklU
RV9ISU5UX1RZUEVfQklUCj4+ICsjZGVmaW5lIE1BWF9QTEFDRU1FTlRfSElOVF9WQUzCoMKgwqAg
KFdSSVRFX0hJTlRfVkFMX01BU0sgLSAxKQo+PiDCoCAjZW5kaWYgLyogX0xJTlVYX1JXX0hJTlRf
SCAqLwo+IAo+IFRoZSBhYm92ZSBtYWNyb3MgaW1wbGVtZW50IGEgdW5pb24gb2YgdHdvIDctYml0
IHR5cGVzIGluIGFuIDgtYml0IGZpZWxkLgo+IFdvdWxkbid0IHdlIGJlIGJldHRlciBvZiBieSB1
c2luZyB0d28gc2VwYXJhdGUgOC1iaXQgdmFsdWVzIHN1Y2ggdGhhdCB3ZQo+IGRvbid0IG5lZWQg
dGhlIGFib3ZlIG1hY3Jvcz8KCkkgaGFkIGNvbnNpZGVyZWQgdGhhdCwgYnV0IGl0IHJlcXVpcmVz
IHR3byBieXRlcyBvZiBzcGFjZS4gSW4gaW5vZGUsIApiaW8sIGFuZCByZXF1ZXN0LgpGb3IgZXhh
bXBsZSB0aGlzIGNoYW5nZSBpbiBpbm9kZToKCkBAIC02NzQsNyArNjc0LDEzIEBAIHN0cnVjdCBp
bm9kZSB7CiAgICAgICAgIHNwaW5sb2NrX3QgICAgICAgICAgICAgIGlfbG9jazsgLyogaV9ibG9j
a3MsIGlfYnl0ZXMsIG1heWJlIAppX3NpemUgKi8KICAgICAgICAgdW5zaWduZWQgc2hvcnQgICAg
ICAgICAgaV9ieXRlczsKICAgICAgICAgdTggICAgICAgICAgICAgICAgICAgICAgaV9ibGtiaXRz
OwotICAgICAgIHU4ICAgICAgICAgICAgICAgICAgICAgIGlfd3JpdGVfaGludDsKKyAgICAgICB1
bmlvbiB7CisgICAgICAgICAgICAgICBzdHJ1Y3QgeworICAgICAgICAgICAgICAgICAgICAgICBl
bnVtIHJ3X2xpZnRpbWVfaGludCBsaWZldGltZV9oaW50OworICAgICAgICAgICAgICAgICAgICAg
ICB1OCBwbGFjZW1lbnRfaGludDsKKyAgICAgICAgICAgICAgIH07CisgICAgICAgICAgICAgICB1
MTYgaV93cml0ZV9oaW50OworICAgICAgIH07CgpXaXRoIHRoaXMsIGdlbmVyaWMgcHJvcGFnYXRp
b24gY29kZSB3aWxsIGNvbnRpbnVlIHRvIHVzZSAKaW5vZGUtPmlfd3JpdGVfaGludC4gQW5kIHNw
ZWNpZmljIHBsYWNlcyAodGhhdCBjYXJlKSBjYW4gdXNlIGVpdGhlciAKbGlmZXRpbWVfaGludCBv
ciBwbGFjZW1lbnRfaGludC4KClRoYXQga2lsbHMgdGhlIG5lZWQgb2YgdHlwZS1iaXQgYW5kIGFi
b3ZlIG1hY3JvcywgYnV0IHdlIGRvbid0IGhhdmUgdGhlIAp0d28gYnl0ZXMgb2Ygc3BhY2UgY3Vy
cmVudGx5LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
