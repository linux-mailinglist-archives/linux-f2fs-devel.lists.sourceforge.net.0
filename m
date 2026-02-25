Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGCGDCM4n2m5ZQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Feb 2026 18:57:55 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6601819BDFA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Feb 2026 18:57:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-Id:MIME-Version:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZvd/8R2VrPgwbzYgD0McMD0UexCYB/3HDMS9/4i8do=; b=alS+QTwUoDSHh2CKchcG859ix6
	LGXRKOn8TAPK+Yzx9p/48cVYNI0s+x1uZqJ1oehluZWqy/Ro57VIVt2V9kOJ/+gxd/+nWyDycx21o
	ecpfCS2It2XZ0kbryvHUew+MJqed8JzHbIRzEtAlj7Wgd84mpEN/SsxNYyWhV+/PzBqE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvJ8l-0000Tw-26;
	Wed, 25 Feb 2026 17:57:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tz2294@columbia.edu>) id 1vvJ8k-0000Tk-4m
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 17:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g2CtBv9ycu+3JvgiINTvUEijkkRH0Jn8UfllUntgBOc=; b=fRHHLv/raC50Z6k2viyfslUJEL
 Qem0R6+YfGSSms21EFIA+5o1UPIjbjbtawHql9Z5RnLeUgOdD1jA/pVFXhs7IB4K4XvCcQjRxYPG5
 acl8SqFlVeSCYRIpTLNsKmHA6nQ1JdKZsUtqLtRnnHC+yDM8iYVcaqpBIZPb/4/qSpE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g2CtBv9ycu+3JvgiINTvUEijkkRH0Jn8UfllUntgBOc=; b=Q
 OidQS0aI5QDIPKBXs1X+ub2LCDqp8RtTvohaJY0YEl9cci1ZSMUA0QuOHOD1dHRW/cNiX6w89Extc
 qiV474G42R500WMdMFFsafB/UOtVzyth9BRzfxyupVEDwqOQXKgRMVzeVI/3M6r+ev3RK5gs/N3gi
 WDW8efAW+V9Dao1I=;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvJ8j-0008MD-FJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 17:57:38 +0000
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PHu5co947493
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 25 Feb 2026 12:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=pps01; bh=g2CtBv9ycu+3JvgiINTvUEijkk
 RH0Jn8UfllUntgBOc=; b=oFjm2nyT48VU70waOG/JF4JAUTOAhoTugeckmqJxro
 tnpqz4vopkLoEobyqx/Dg1tc9ed3QzRwX6n7plg31kZSuDiE3vp9Du69GPBLE8XV
 EejzfBGYX+ZjcszixaDkXvIFm/TIEzWPBQDhPz3QxExnobOLvdDkaqPkbOfJYQys
 LRcbov9DAsJ7B4ILygQHt4O6AW6olXEWQzOYf28LWaA9aO/r6B/FARakalkLj9u2
 o6ifdGqRBh0MOBlR0tFBbtF5F5jWPRuzoN87Kkms7VOCw3JUFMBnDku2g+FF2ZV6
 Ai+x1+BXo5UamVFrgbATW22vXQsYHPxVXYFQjpkUB0DQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4chxa0kmn8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 12:57:31 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5032e68560dso95487541cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 09:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772042251; x=1772647051;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2CtBv9ycu+3JvgiINTvUEijkkRH0Jn8UfllUntgBOc=;
 b=IIqdR89stL0+Na52EGzicc4LrKtSUutOPi/deRYcmx/UncTY0Q3OIgi1MdxaNXyua4
 VLHH2+tePpCLxLlPWTVluyOjZO1eLqwEmK34ZWx7dG+0pAvRD8hPH6netGILSmlSWSxs
 z8E3TxJGwo+xHXwVOXNNRaLQ7Z1JvKVzG+FuyTCfQrMbkD35aWm2jtKbbxVl68gQBnAJ
 8PTT7SCrmOEYiuFkAOMBd9XFs2zGyklqhvyDMCiHXD6uY22gtfcv0+25oWdMGqytWPOa
 UYZQELKKt9/6YBk0LEzzbOYVhdOd5qkB6+HoO0/Kz1N/xkZFz3Ut6uH9llNpnNWFujZA
 Omsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt+AI4DG4B0Y+PXBmY3zPvcphStxYyupMg1bUl5lYLRf6yEdvurxKiiI3F5+TnblMsGFKpl9c+Xwsk/PffupdS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YymTa+/UgOP7BJLC/yvX8IrKDCNAsEq+79JHCIcHrRCrebFjYBU
 W1ZXSpGTwywnO5Fn+9Z7Zslcbuawj6GtQP1w5PTmqbt6Ymv+cFlMS+DbM48sYS4G6BD92f8YCZp
 RCkKY4ZDsbI5Po3I0U4IBa7emzSR6QAx1RyPBwqia9yrMXSnaestnszl5rG+RokoEXJawjwv1eP
 k=
X-Gm-Gg: ATEYQzzKEx3kk9AXCasTXy4E+mcP0cjsVX50Q4A9102m22HBgmrVZc4SdPUyASvZwnU
 IMwBNUBlwWV7Yf8cCV5rmojIwSpS0Xd4LbeLcHjo9cyP5r/+2qRItpI183oMD3G3rLBcNwQIETA
 hmi6/rx7uMydpPDMZ6e+iXonLmEp98/cYN0/8voV6qY6rmll1rhb0uBlH1flSpm0SQ625KF/F2V
 5uSjVLgzal69T79NV+pXnY+XwZfGGRIXAhTrMp7yZoBbstXGdooHhaZCld8zfF8e1S6/Sp0cABL
 mXWZ12ZdTUEMmkwsf94a13HuOAH1MMBH7xn//SWuxJmf6vjWodudOlHlCbrswWCzZsuq/1JIqWI
 d+69clL3Co1uprrBbzSCQFWM/7RUCme/I
X-Received: by 2002:ac8:7dc7:0:b0:4ff:9688:7dca with SMTP id
 d75a77b69052e-50741f09b1bmr17698481cf.8.1772042250983; 
 Wed, 25 Feb 2026 09:57:30 -0800 (PST)
X-Received: by 2002:ac8:7dc7:0:b0:4ff:9688:7dca with SMTP id
 d75a77b69052e-50741f09b1bmr17698161cf.8.1772042250520; 
 Wed, 25 Feb 2026 09:57:30 -0800 (PST)
Received: from [127.0.1.1] ([216.158.158.246])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-899a55a1b05sm49667426d6.14.2026.02.25.09.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 09:57:30 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 12:57:16 -0500
MIME-Version: 1.0
Message-Id: <20260225-pagevec_cleanup-v1-1-38e2246363d2@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAPs3n2kC/x3MQQqAIBBA0avErBNsKIOuEhE2jjUQJkoRRHdPW
 r7F/w9kTsIZhuqBxJdkOUJBU1dAmw0rK3HFgBqNRuxUtCtfTDPtbMMZlWt7agwt2qODUsXEXu7
 /OE7v+wEjlzT9YQAAAA==
X-Change-ID: 20260225-pagevec_cleanup-d47c16cb0f2d
To: David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772042249; l=2363;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=UBo17b3BnyCir9+y0a9+96yC4OeoD/3nI6Q4Q96kwCo=;
 b=BzOAcZbxVEgReQZjDaxCvDEVIznzgnP+yOBPfUqzQ7pA1YgihdUcOW+lweXj2SJ2LT5iyi6+E
 nJqWdYIr7U3A74CNAHeYTN9aFsX8qOT9lJdPmS9Ws2GjgA3bsm8xwao
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=Csiys34D c=1 sm=1 tr=0 ts=699f380b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=mD05b5UW6KhLIDvowZ5dSQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=H_Tkdi8iVt-5paQiyzkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ILkjTIu5-YOzTdl9i_HOwThDFP6ox3K-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE3MSBTYWx0ZWRfX4k8IqpgE/JuA
 DN5t39GlT75mODG9hDiPDGUxwWDPQdpAiM7OKhhxUsvykkUxvgqsEwE2JI77rCM/EuHBiZbsckn
 1EWYqQSAPeS2lsnD7NhDLFmdOwLGTD5V2iy5SYYxRQ7Y+MN5DoFVm33PmcuqRDG0zFhLPUIwG8z
 2nGYCmXgEyyTWR7b1gBRiqcF4ubNpVkYJO1GoHc7kg6jRgyDkYfOss0zfrRHsgO97erBh2p7hUK
 c11V9dyqcf47KkGExMTB0FCdKScmZXLSwZv/CzHU4ntyRzOmtM5W4PUqtmr72VzhEYTNGAYPiH4
 vIyTsROowBbMP5B45DFMoaIkLIJsA2LWx2Tsib+dnGg8OlzQCJLR7/x4EAST2qIX1I0gPitBxOZ
 elPcCo7yz/Q/HMoZAZwoHgjza7Witu7McKCJEbTD8Z+NzDl987KcfrRVCaQ9K2TW3vJzs7Bf7xl
 YSIRehZ6YKJph0xk3JQ==
X-Proofpoint-ORIG-GUID: ILkjTIu5-YOzTdl9i_HOwThDFP6ox3K-
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1011 lowpriorityscore=10
 impostorscore=10 phishscore=0 suspectscore=0 bulkscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250171
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: struct pagevec was removed in commit 1e0877d58b1e ("mm:
 remove
 struct pagevec"). Remove remaining forward declarations and change
 __folio_batch_release()'s
 declaration to match its definition. Signed-off-by: Tal Zussman
 <tz2294@columbia.edu>
 --- Happy to rename PAGEVEC_SIZE and pagevec.h if desired too, but that'd
 be ~65 more lines of churn... Although it looks like there are plenty of
 .c f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vvJ8j-0008MD-FJ
Subject: [f2fs-dev] [PATCH] mm: Remove stray references to struct pagevec
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
Cc: linux-mm@kvack.org, Tal Zussman <tz2294@columbia.edu>,
 linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[columbia.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:marc.dionne@auristor.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:willy@infradead.org,m:linux-mm@kvack.org,m:tz2294@columbia.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-afs@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,columbia.edu:s=pps01];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,auristor.com,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,tencent.com,huaweicloud.com,gmail.com,infradead.org];
	FORGED_SENDER(0.00)[tz2294@columbia.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,columbia.edu:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,columbia.edu:mid,columbia.edu:email];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tz2294@columbia.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6601819BDFA
X-Rspamd-Action: no action

struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct
pagevec"). Remove remaining forward declarations and change
__folio_batch_release()'s declaration to match its definition.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
Happy to rename PAGEVEC_SIZE and pagevec.h if desired too, but that'd be
~65 more lines of churn... Although it looks like there are plenty of .c
files that include it for no reason, so could be a good opportunity to
remove those.
---
 fs/afs/internal.h       | 1 -
 fs/f2fs/f2fs.h          | 2 --
 include/linux/pagevec.h | 2 +-
 include/linux/swap.h    | 2 --
 4 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 009064b8d661..599353c33337 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -31,7 +31,6 @@
 
 #define AFS_CELL_MAX_ADDRS 15
 
-struct pagevec;
 struct afs_call;
 struct afs_vnode;
 struct afs_server_probe;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb34e864d0ef..d9e8531a5301 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -28,8 +28,6 @@
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
 
-struct pagevec;
-
 #ifdef CONFIG_F2FS_CHECK_FS
 #define f2fs_bug_on(sbi, condition)	BUG_ON(condition)
 #else
diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index 63be5a451627..007affabf335 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -93,7 +93,7 @@ static inline struct folio *folio_batch_next(struct folio_batch *fbatch)
 	return fbatch->folios[fbatch->i++];
 }
 
-void __folio_batch_release(struct folio_batch *pvec);
+void __folio_batch_release(struct folio_batch *fbatch);
 
 static inline void folio_batch_release(struct folio_batch *fbatch)
 {
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0effe3cc50f5..4b1f13b5bbad 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -20,8 +20,6 @@ struct notifier_block;
 
 struct bio;
 
-struct pagevec;
-
 #define SWAP_FLAG_PREFER	0x8000	/* set if swap priority specified */
 #define SWAP_FLAG_PRIO_MASK	0x7fff
 #define SWAP_FLAG_DISCARD	0x10000 /* enable discard for swap */

---
base-commit: 957a3fab8811b455420128ea5f41c51fd23eb6c7
change-id: 20260225-pagevec_cleanup-d47c16cb0f2d

Best regards,
-- 
Tal Zussman <tz2294@columbia.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
