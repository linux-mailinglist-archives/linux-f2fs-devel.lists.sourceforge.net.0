Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09F967EBC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2024 07:19:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1skzSp-0001cC-61;
	Mon, 02 Sep 2024 05:18:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1skzSn-0001c5-OX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 05:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j48tXrfPFLQpQy7ehDudz1ll+W1pF1dhPhX8Mc3nQqc=; b=VkqyLFxmNji/c0hW+H5LZo8BfY
 EW4r9sVyuIfm5NKb5fuFvI24l/ZjjvGOsKqDb8XuarGd1LVoz86zOzWs8tW5E5jFH9JsQsIdAnwLi
 Vud0ADPXjotlxEiHWzAmFOMoiLDNUH+EUE6NPwxi7sGKSRtUgAZHuymckACf47v+0o14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j48tXrfPFLQpQy7ehDudz1ll+W1pF1dhPhX8Mc3nQqc=; b=C4njo45orsP68vs63uxmpYQ2+Z
 EJNe+DFmSAAdvyfYcBAk0jhn3fcOg4kD5C0ieBvPSJE+J165ZyDYUifgq0vT4Xbj6lYBLNco91FJg
 4eAA95GmQrwMnDZrRkco3jppRLveJrZOXT1+0nQZr5MKODO+E30w+CItOwXdIaVsRjQA=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1skzSm-0006EK-61 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 05:18:54 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240902051839epoutp04d88e465ced4575121d45666e5dfbee3e~xVamieyN-1320413204epoutp04b
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 Sep 2024 05:18:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240902051839epoutp04d88e465ced4575121d45666e5dfbee3e~xVamieyN-1320413204epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725254319;
 bh=j48tXrfPFLQpQy7ehDudz1ll+W1pF1dhPhX8Mc3nQqc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=rCxTO0L7UCcIFdxMmHf8dasIruE4sJkM+JTXoq/XbLrVESVOyEPP+7n3PKTNHm4WZ
 0713y22C6yeaHHrPuO8vWOATp40SD7nEf9uYWaqiMMbtQl6QPNzwnUAqVYVJ3l9FOx
 PM6QWs84fHlHYtYIYutJWszH4avkYyo/HMS1QNMs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20240902051838epcas5p14c257efc542d4b9a274b9dc4c277d225~xVal_rM6o1678716787epcas5p1Q;
 Mon,  2 Sep 2024 05:18:38 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Wxxqc65zdz4x9Pq; Mon,  2 Sep
 2024 05:18:36 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 89.2C.09743.CAA45D66; Mon,  2 Sep 2024 14:18:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240902051836epcas5p39b730254365bd2c759417178d2f6da95~xVajpRyl00854708547epcas5p3D;
 Mon,  2 Sep 2024 05:18:36 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240902051836epsmtrp1da38afc11821c9b95fb4d33e235eb199~xVajoayr80087300873epsmtrp1j;
 Mon,  2 Sep 2024 05:18:36 +0000 (GMT)
X-AuditID: b6c32a4a-3b1fa7000000260f-46-66d54aacd6fd
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DF.E4.07567.CAA45D66; Mon,  2 Sep 2024 14:18:36 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240902051833epsmtip1f4f6ade22e4a2ede413b18d72ce57cef~xVagrBjGC2920229202epsmtip1s;
 Mon,  2 Sep 2024 05:18:32 +0000 (GMT)
Message-ID: <3343ecc2-6c19-e509-5f17-ceaa4f88efae@samsung.com>
Date: Mon, 2 Sep 2024 10:48:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, axboe@kernel.dk,
 kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, brauner@kernel.org, jack@suse.cz,
 jaegeuk@kernel.org, jlayton@kernel.org, chuck.lever@oracle.com
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <0cfd7841-ea11-48c6-93fb-7817236c81c8@acm.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJJsWRmVeSWpSXmKPExsWy7bCmpu4ar6tpBnv6tS1W3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWcye3sxk8WT9LGaLjf0cFo/vfGa3+LlsFbvFpEPXGC32
 3tK2uLTI3WLP3pMsFvOXPWW36L6+g81i+fF/TBbrXr9nsTg/aw67g4jH5SveHufvbWTxmDbp
 FJvH5bOlHptWdbJ5bF5S77F7wWcmj903G9g8Pj69xeLRt2UVo8eZBUfYPT5vkgvgicq2yUhN
 TEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAF6UkmhLDGnFCgU
 kFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYFKgV5yYW1yal66Xl1piZWhgYGQKVJiQnfHl3yH2
 gpksFWeu32JsYFzB3MXIySEhYCJx8sUC9i5GLg4hgd2MEv/W3GKCcD4xSnTPmMcG4XxjlPh4
 ajUjTEvLn5ksEIm9jBLHV39gA0kICbxllPjfGwti8wrYSWz6shWogYODRUBF4uvVIIiwoMTJ
 mU9YQGxRgSSJX1fngM0UFrCR2Ph7FdhJzALiEreezAe7QkRgKpPEgT8tYMuYQea/nrWAGWQo
 m4CmxIXJpSANnALWEsdOvYJqlpdo3jqbGaReQmA6p8TPG90sEFe7SDxfuR/qaWGJV8e3sEPY
 UhIv+9ug7GyJB48eQNXXSOzY3McKYdtLNPy5wQqylxlo7/pd+hC7+CR6fz9hAglLCPBKdLQJ
 QVQrStyb9BSqU1zi4YwlULaHxOVfy6Hh9o5Rov3JTpYJjAqzkMJlFpL/ZyF5ZxbC5gWMLKsY
 JVMLinPTU4tNC4zyUsvhEZ6cn7uJEZwHtLx2MD588EHvECMTB+MhRgkOZiUR3qV7LqYJ8aYk
 VlalFuXHF5XmpBYfYjQFxs9EZinR5HxgJsoriTc0sTQwMTMzM7E0NjNUEud93To3RUggPbEk
 NTs1tSC1CKaPiYNTqoEp6mTPe+2fi6JPnXmmNNljf2fPniXNGsF3aq47fS5suD9pN89n723b
 f4Qcm/nK1G1TVAdv7Xf5QNeOjWJXmU7vj+qRdXc+0PK67ahJyl6R/20t/noT1eq829cKm6bs
 Pyr4UGsbt96CwJ99kQ1BsycZ7XhSw7ND4RNrd3s7T9jGOfkJp55t/R7GtZstWkZHJfv/coMb
 e7Qu8PGazFH88kn2xa+3ry+eLnK/Oc3+QLuOm0iO6/WCf75lfEv3dVyekvn2wmv+72+nWMjJ
 6J7nNGIoDefh2a9usO+e2YbFAk96Mk+/5J3ReNUrY5rsnWzDAoH9q/aLcl33+DflvM06n4XG
 adzqGywf5CzJaW/JNRdVYinOSDTUYi4qTgQAYNIahYwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWy7bCSnO4ar6tpBtc3s1usvtvPZvH68CdG
 i2kffjJb/L/7nMni5oGdTBYrVx9lspg9vZnJ4sn6WcwWG/s5LB7f+cxu8XPZKnaLSYeuMVrs
 vaVtcWmRu8WevSdZLOYve8pu0X19B5vF8uP/mCzWvX7PYnF+1hx2BxGPy1e8Pc7f28jiMW3S
 KTaPy2dLPTat6mTz2Lyk3mP3gs9MHrtvNrB5fHx6i8Wjb8sqRo8zC46we3zeJBfAE8Vlk5Ka
 k1mWWqRvl8CV8eXfIfaCmSwVZ67fYmxgXMHcxcjJISFgItHyZyYLiC0ksJtRomu1GURcXKL5
 2g92CFtYYuW/50A2F1DNa0aJxw3nmUASvAJ2Epu+bGXsYuTgYBFQkfh6NQgiLChxcuYTsJmi
 AkkSe+43gpULC9hIbPy9CmwvM9D8W0/mM4HMFBGYyiSx8sVVsAXMAm8ZJVoPHGGB2PaOUeLy
 wVvMIBvYBDQlLkwuBenmFLCWOHbqFdQkM4murV2MELa8RPPW2cwTGIVmITlkFpKFs5C0zELS
 soCRZRWjZGpBcW56brJhgWFearlecWJucWleul5yfu4mRnDMa2nsYLw3/5/eIUYmDsZDjBIc
 zEoivEv3XEwT4k1JrKxKLcqPLyrNSS0+xCjNwaIkzms4Y3aKkEB6YklqdmpqQWoRTJaJg1Oq
 gSm31EDtqie79SJx27+567d0x+9nKnY855R8YEvz7Hseq70UJ0ml5ziZuu0SnpNrPfXgBOfY
 LWxiR5buDf64VVOqaJfudYtyw3YRn0MvUrZdfd5QnqZoZKOx9tTO6jgRfrsTCoLc/30kC2Kj
 GE6daZyyTjBaufXrlDJVLY87HXMvFaYs5rasuTztfn7XxYy6U9E584RnnY1l67h5eYve9G5L
 ruZFPsHKPd+Pnjfbvia2VKvKxPzE7MINluWvvT5v235pwm+uHkd1C+GI18o37f4+UVln9se8
 4Ne7L3G6lq/dJH8+feC7Kd1umvu2svO/YmZ2RpzheNdpGve5ZmHVht0r2/znrDgX767Bz/tx
 hRJLcUaioRZzUXEiAMk9H9loAwAA
X-CMS-MailID: 20240902051836epcas5p39b730254365bd2c759417178d2f6da95
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240826171413epcas5p3f62c2cc57b50d6df8fa66af5fe5996c5
References: <20240826170606.255718-1-joshi.k@samsung.com>
 <CGME20240826171413epcas5p3f62c2cc57b50d6df8fa66af5fe5996c5@epcas5p3.samsung.com>
 <20240826170606.255718-2-joshi.k@samsung.com>
 <0cfd7841-ea11-48c6-93fb-7817236c81c8@acm.org>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 8/30/2024 5:47 PM, Bart Van Assche wrote: > On 8/26/24
   1:06 PM, Kanchan Joshi wrote: >>   /* Block storage write lifetime hint values.
    */ >> -enum rw_hint { >> +enum rw_life_hint { > > The name "r [...] 
 
 Content analysis details:   (-3.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [203.254.224.34 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [203.254.224.34 listed in list.dnswl.org]
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1skzSm-0006EK-61
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOC8zMC8yMDI0IDU6NDcgUE0sIEJhcnQgVmFuIEFzc2NoZSB3cm90ZToKPiBPbiA4LzI2LzI0
IDE6MDYgUE0sIEthbmNoYW4gSm9zaGkgd3JvdGU6Cj4+IMKgIC8qIEJsb2NrIHN0b3JhZ2Ugd3Jp
dGUgbGlmZXRpbWUgaGludCB2YWx1ZXMuICovCj4+IC1lbnVtIHJ3X2hpbnQgewo+PiArZW51bSBy
d19saWZlX2hpbnQgewo+IAo+IFRoZSBuYW1lICJyd19saWZlX2hpbnQiIHNlZW1zIGNvbmZ1c2lu
ZyB0byBtZS4gSSB0aGluayB0aGF0IHRoZQo+IG5hbWUgInJ3X2xpZmV0aW1lX2hpbnQiIHdvdWxk
IGJlIGEgYmV0dGVyIG5hbWUuCj4gCgpJIGNhbiBjaGFuZ2UgdG8gdGhhdCBpbiBuZXh0IGl0ZXJh
dGlvbi4KVGhpcyBjaGFuZ2UgbmVlZHMgdG8gYmUgY29uc2lzdGVudCBpbiBhbGwgdGhlIHBsYWNl
cy4gQnV0IG1vcmUgaW1wb3J0YW50IAppbiBwYXRjaCAjMyAoYXMgd2UgZXhwb3NlIFRZUEVfUldf
TElGRV9ISU5UIHRvIHVzZXJzcGFjZSkuIERvIHlvdSBoYXZlIApjb21tZW50cyBvbiB0aGUgb3Ro
ZXIgcGFydHM/CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
