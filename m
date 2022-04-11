Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA54FBC3F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Apr 2022 14:38:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ndtJe-0002s6-Cd; Mon, 11 Apr 2022 12:38:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hoeppner@linux.ibm.com>)
 id 1ndtJb-0002rw-Pt; Mon, 11 Apr 2022 12:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gYNUMVwDP13qlMS4+UHaJJ3PaCFPgROQJTYtqXnOX7M=; b=mtMaB9sZtOwISSfqVIpicEJNWM
 ikG48ZpF0yRnXa1VYDUUWZ8ziWjxfulvnWUGKrFBuwBLci+HrR4coM5KaIuKECaARN19aIYP7Har3
 Qt7LkwD2zAYIu0LgKWzNyfA4rMZztAOfgNvBwURwmDdvIBd0vMcj6Eno/osgAIWhPZIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gYNUMVwDP13qlMS4+UHaJJ3PaCFPgROQJTYtqXnOX7M=; b=NWEfTRHISmgZADlmwGbqUykZEz
 fU//sOn05eh++CYFB/YRsQCkz75wCBtb/x7AwBmS1zpm1WSSjNGHdtp1yW1xQlBkZXJI2imjtkyun
 u0gbqY0Nsq9+e7br5Jv9s/v9lMeu4uuHQSxt9Y+GGmrh/sSKW0FkzE+ggfYNevMHx83Y=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ndtJU-00Cj4b-4R; Mon, 11 Apr 2022 12:38:40 +0000
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23B9NnvU025178; 
 Mon, 11 Apr 2022 12:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gYNUMVwDP13qlMS4+UHaJJ3PaCFPgROQJTYtqXnOX7M=;
 b=RDqgcHKph8Jm2BhrynHRzlAqx8nGWKQVGDEreK7n+J6njlw2fY/eROIb0LG1Go0keNpO
 U7B7ao4FH0/uzQKEPYrHVhNG/pJ2E7Z6UBEEa2SxZlUdVDQJZ6TEFr72vPR9TSXOEBKG
 MqlChSHpWchCsB0wZHoGw70dgQSIwe1Dr/3iyUd7QHcinyuGvNuFdGbEFCrbqw9Rsc9z
 JkcowV5iFVIqo42z4/eOag4ZGEVEYQqZe/457g+H8egdMxH/HXBM9/jRkB0BPaAeZihE
 GFX1OIArRJYPFHkICDQZB90KgaeOXTtU3/g2gqArNZA/NmuhAbDjv3WPLEAFQ6zGE6gp Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fchnqtx4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 12:03:59 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BAmtcM013717;
 Mon, 11 Apr 2022 12:03:58 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fchnqtx39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 12:03:58 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BC3gZm003276;
 Mon, 11 Apr 2022 12:03:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3fb1s8u242-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 12:03:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23BC40Q146596476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 12:04:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1327BA4065;
 Mon, 11 Apr 2022 12:03:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9DE7A404D;
 Mon, 11 Apr 2022 12:03:50 +0000 (GMT)
Received: from [9.145.81.78] (unknown [9.145.81.78])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Apr 2022 12:03:50 +0000 (GMT)
Message-ID: <e971095e-1015-c348-3c24-114193ee5ff0@linux.ibm.com>
Date: Mon, 11 Apr 2022 14:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-25-hch@lst.de>
From: =?UTF-8?Q?Jan_H=c3=b6ppner?= <hoeppner@linux.ibm.com>
In-Reply-To: <20220409045043.23593-25-hch@lst.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fq1U6p5RSJi3IUi0XnNkXpRDl0Ogb6A0
X-Proofpoint-ORIG-GUID: D9QlKI8GujOSuLx30db3fYGBx6ksQFZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_04,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204110067
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/04/2022 06:50, Christoph Hellwig wrote: > Just use a
 non-zero max_discard_sectors as an indicator for discard > support, similar
 to what is done for write zeroes. > > The only places where needs [...] 
 Content analysis details:   (-1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.156.1 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ndtJU-00Cj4b-4R
Subject: Re: [f2fs-dev] [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org,
 =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDkvMDQvMjAyMiAwNjo1MCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSnVzdCB1c2Ug
YSBub24temVybyBtYXhfZGlzY2FyZF9zZWN0b3JzIGFzIGFuIGluZGljYXRvciBmb3IgZGlzY2Fy
ZAo+IHN1cHBvcnQsIHNpbWlsYXIgdG8gd2hhdCBpcyBkb25lIGZvciB3cml0ZSB6ZXJvZXMuCj4g
Cj4gVGhlIG9ubHkgcGxhY2VzIHdoZXJlIG5lZWRzIHNwZWNpYWwgYXR0ZW50aW9uIGlzIHRoZSBS
QUlENSBkcml2ZXIsCj4gd2hpY2ggbXVzdCBjbGVhciBkaXNjYXJkIHN1cHBvcnQgZm9yIHNlY3Vy
aXR5IHJlYXNvbnMgYnkgZGVmYXVsdCwKPiBldmVuIGlmIHRoZSBkZWZhdWx0IHN0YWNraW5nIHJ1
bGVzIHdvdWxkIGFsbG93IGZvciBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogTWFydGluIEsuIFBldGVyc2VuIDxtYXJ0
aW4ucGV0ZXJzZW5Ab3JhY2xlLmNvbT4KPiBBY2tlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVy
IDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4gW2J0cmZzXQo+IEFja2VkLWJ5OiBD
b2x5IExpIDxjb2x5bGlAc3VzZS5kZT4gW2JjYWNoZV0KPiAtLS0KCkZvciAKCj4gIGRyaXZlcnMv
czM5MC9ibG9jay9kYXNkX2ZiYS5jICAgICAgIHwgIDEgLQoKQWNrZWQtYnk6IEphbiBIw7ZwcG5l
ciA8aG9lcHBuZXJAbGludXguaWJtLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
