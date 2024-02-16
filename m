Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1D858235
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Feb 2024 17:13:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rb0qX-0001Dk-Ru;
	Fri, 16 Feb 2024 16:13:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quic_jhugo@quicinc.com>) id 1rb0qU-0001Dd-9e
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Feb 2024 16:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+s47s+oRh66JHw0QvJ6IVx2HVUlYYq8i2oqDQRbbDig=; b=WAObFCcV4qoEFeQq5P1cOL/d2I
 TRouBH6yvW6+55qVAL0IIYuLcpVgZAwlokpSPEuAPx5oYk39KXz8OesEMwGOsmjWM08ipfQMB07z6
 nQWSDUlBYHSfepUlGQZ7Bj7svVi7DgetkM0zu956/FpHfFGfNQkrwlilv52BQm/Bg91w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+s47s+oRh66JHw0QvJ6IVx2HVUlYYq8i2oqDQRbbDig=; b=DlFvzUL7YcAYjHcKChUc3l2ks+
 hsFuPrMm9Vc+O5P8m63eni8cMX6sv7NDhhITo2M13gAQjhvl+l9nGM1u0d3dbJUJ0Kr8Mc6Mmn52L
 VX2UEVE0HyiL27XalQyuVevzvL19RzutlfZcEd4dv7wu2ol2asOpSo+8SYo07CdlfKMc=;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rb0qS-0001dH-KX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Feb 2024 16:13:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GDrAhE004249; Fri, 16 Feb 2024 16:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=+s47s+oRh66JHw0QvJ6IVx2HVUlYYq8i2oqDQRbbDig=; b=lF
 FJCQwzs80Of5CG+ukeY9DHL2bH7il19HDv5gI9hnHgau0nkXlj3Ld+CmTXojaddx
 fQOiQ30S7Zzn04MpZ/j6dG5B+s56Brbakz1+kqEs74n2IM5SCbxOUeXv7DL0AjW6
 5OO11o6eA+hAZgkBsXxevUFrifBHQt/MwqGlMYN0p3rNbRqkIvNycD8W+2BBeqJy
 JKMXJniTgZoNf5mbyLzJ1nU5V7U5Te0LY/srqMU6VZevK1Hf/lLSbjrsTi08k9IO
 qSrwT4+7Y1ig9oOieup8oGy9Dnok7ZcUacZ3LaSn5EGzK6Qn4wUB+6gcJdfzjx7H
 ZP+m9OL9Sta2iQC41VQg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9fkfc0y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 16:13:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GGDZiH015439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 16:13:35 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 16 Feb
 2024 08:13:35 -0800
Message-ID: <ce40205b-25c6-6ba5-23a4-70a51b4e1b21@quicinc.com>
Date: Fri, 16 Feb 2024 09:13:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <quic_stummala@quicinc.com>,
 <quic_bjorande@quicinc.com>
References: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Cr2KoCkvvaPxsIziVfFyMR7TPWg19cuW
X-Proofpoint-GUID: Cr2KoCkvvaPxsIziVfFyMR7TPWg19cuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_15,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=307
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160130
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/2/2024 9:52 AM, Jeffrey Hugo wrote: > The servers for
 the @codeaurora domain are long retired and any messages > addressed there
 will bounce. Sahitya Tummala has a .mailmap entry to an > updated [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.4 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1rb0qS-0001dH-KX
Subject: Re: [f2fs-dev] [PATCH] f2fs: doc: Fix bouncing email address for
 Sahitya Tummala
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/2/2024 9:52 AM, Jeffrey Hugo wrote:
> The servers for the @codeaurora domain are long retired and any messages
> addressed there will bounce.  Sahitya Tummala has a .mailmap entry to an
> updated address, but the documentation files still list @codeaurora
> which might be a problem for anyone reading the documentation directly.
> Update the documentation files to match the .mailmap update.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Jaegeuk Kim will you apply this?

-Jeff


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
