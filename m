Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A16861C37
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 20:02:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdanx-0006d5-7g;
	Fri, 23 Feb 2024 19:01:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quic_jjohnson@quicinc.com>) id 1rdanu-0006cw-DN;
 Fri, 23 Feb 2024 19:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kfo/C8zqynWW3khr9w38fLA/juhM//M+1TSK7YbUzao=; b=Zx/X3jbdEFvgXbXw52qlRuShSU
 ukx9WFI/ntvGCYRNHHLVtueGMV29AYUgk6ng6gM9DeBGfZaKUBsSzsuQPmAZLQzp9vRZjkZqXYY2b
 zC4AKB+/OSqWJbol21zsORzq+BemkxQpRMYp+PtZJdJerKQWGV4cDfFSnxNN6zb8X2Fw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kfo/C8zqynWW3khr9w38fLA/juhM//M+1TSK7YbUzao=; b=Cp4qj6ylzMW7DbHSWSewLZlqI7
 AT5lFI9hoGpj4R5o4D1eJGORYKjq5toWAOU461lg5skrIZn5+7S4lxyRIzEDvmjTAxtsD/BV0rDU9
 pFa5YVqktAxKczUadY7jp6pDUq9irJmLUFTCS5L+RYpfvf8CuxskHGXBjKCXZ3aIhDHE=;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdanu-0006OA-78; Fri, 23 Feb 2024 19:01:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41NEnafk007025; Fri, 23 Feb 2024 18:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Kfo/C8zqynWW3khr9w38fLA/juhM//M+1TSK7YbUzao=; b=SM
 1IU5a4CNIWLmOnc+jXipb4Ga9eIJLWms0rnPxEXMwHDSoxe92W9Ew+cz2UneOT08
 Iyi2XyxnbZDa1t3nXppWD2gBv5baFGSu5jpaJXHu6vAsxhujSo74jXQc1qhtrkyj
 b1JYz/cxWMolVJrmsIH4767eZriXHsfPc1ASRZIKs+Vh4MImjLRwoZRf+c04IWja
 WREgwfvGpnGGa1IxPu7qJXJNToVvZY2M73nvMYmrwiDnSM6QuEXhaYYJoUiQlYDP
 AVkDtm/36vZFGTWQ5CsU0kJMULpTBDkWBl74wMVr5RZuQ0KaRJ0q/8gb9Xik4nP2
 o7j3uPWaxue4GCbloFJw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we3233ydp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 18:30:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NIUm69006076
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 18:30:48 GMT
Received: from [10.110.104.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 10:30:46 -0800
Message-ID: <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
Date: Fri, 23 Feb 2024 10:30:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>
References: <20240223125634.2888c973@gandalf.local.home>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240223125634.2888c973@gandalf.local.home>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: wCcVNA_rPgQQt00obewLDHJucphy8QWk
X-Proofpoint-GUID: wCcVNA_rPgQQt00obewLDHJucphy8QWk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_04,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 mlxlogscore=793 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230136
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/23/2024 9:56 AM, Steven Rostedt wrote: > From: "Steven
 Rostedt (Google)" <rostedt@goodmis.org> > > [ > This is a treewide change.
 I will likely re-create this patch again in > the second week of [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rdanu-0006OA-78
Subject: Re: [f2fs-dev] [FYI][PATCH] tracing/treewide: Remove second
 parameter of __assign_str()
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ath10k@lists.infradead.org,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-s390@vger.kernel.org,
 dev@openvswitch.org, linux-cifs@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, iommu@lists.linux.dev,
 ath11k@lists.infradead.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-erofs@lists.ozlabs.org, virtualization@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 ocfs2-devel@lists.linux.dev,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-cxl@vger.kernel.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, linuxppc-dev@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ath12k@lists.infradead.org,
 tipc-discussion@lists.sourceforge.net, Masami Hiramatsu <mhiramat@kernel.org>,
 netdev@vger.kernel.org, bpf@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/23/2024 9:56 AM, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.9 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> With the rework of how the __string() handles dynamic strings where it
> saves off the source string in field in the helper structure[1], the
> assignment of that value to the trace event field is stored in the helper
> value and does not need to be passed in again.

Just curious if this could be done piecemeal by first changing the
macros to be variadic macros which allows you to ignore the extra
argument. The callers could then be modified in their separate trees.
And then once all the callers have be merged, the macros could be
changed to no longer be variadic.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
