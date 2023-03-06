Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C9E6AC12E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Mar 2023 14:33:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZAxX-0000A8-4e;
	Mon, 06 Mar 2023 13:32:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quic_mojha@quicinc.com>) id 1pZAxV-00009z-Vj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Mar 2023 13:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q2jlX39BuxHZUxqQJCS0V6f2hdX5HmqoSngiobuaRUY=; b=O4Rr/W5tzfAx47ArneBDpE0Via
 XyxBKoj7tk3ah0l8DBJp21enJlldDrEFotp+t6MdY48a1P2inHdxSmaVjJ45DNYPRxdo0+0T7P111
 TpbgMQzLqlCZ/h2s53/TvHQXvNDacHjJwhUmsb6Z47cC28dH5ACZce8IFkhtT2MfJ4hY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q2jlX39BuxHZUxqQJCS0V6f2hdX5HmqoSngiobuaRUY=; b=UvtWoRHLH7+KPOe5YG0Ki8uBnR
 E94R0SG6IHY7IvZCBZvA0UIV1fpHHM3yLbt3S603UKcqqQERFQCNsoaHIooFcEaxMeMzEx8ofsc5P
 9OPmLtmOkS+2i2hhUdd6VPxIkzS356LEDlpROOh6dmOf+DPJXHo6ARdIj3T1S1gBPmtg=;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZAxR-0001kG-6p for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Mar 2023 13:32:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32652YAr022938; Mon, 6 Mar 2023 12:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Q2jlX39BuxHZUxqQJCS0V6f2hdX5HmqoSngiobuaRUY=;
 b=e7dPY+2A/UXgMVinv++xA2oPvr7o9MoIwvDjp+6hkgRkmr81HbKifPENVsIZzL9pViPR
 nSkKALuiRnd3qtvwHckMokjCyBYhmVHThvBHdfO28/GBSRhpF2PtbfjA9MmZqqrDkJhl
 cdnHVo0DHzs+RVoSYpQzUwnhoIf/NaGzADqfvlo+Rd8N6xSL067KDuGICVi2yzQOSrKB
 Bgai041uVA4EvhchhqBU9eox1yeilv4O9LW9gc9qN+9wbSYGv6Hojij8LwYpi2Tr9FbR
 V7k+31EcXtC1up2cWSgu9XN/C9SdcEoTGi+R+VV9Jww7aweNiNJNVgF9RWN0mPmY6P/L oA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p41j6cpkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 12:52:05 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 326Cq40t016393
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Mar 2023 12:52:04 GMT
Received: from [10.204.79.110] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 6 Mar 2023
 04:52:01 -0800
Message-ID: <7a812676-086d-60d2-2cc4-9a9c5f0a872f@quicinc.com>
Date: Mon, 6 Mar 2023 18:21:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Douglas RAILLARD <douglas.raillard@arm.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "open
 list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>, "open
 list:TRACING" <linux-kernel@vger.kernel.org>, "open list:TRACING"
 <linux-trace-kernel@vger.kernel.org>
References: <20230306122549.236561-1-douglas.raillard@arm.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20230306122549.236561-1-douglas.raillard@arm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SG11kEEpxNNCpC5ZFUIcNq_iAqTUDJSS
X-Proofpoint-ORIG-GUID: SG11kEEpxNNCpC5ZFUIcNq_iAqTUDJSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_05,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxlogscore=722 clxscore=1011 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060113
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/6/2023 5:55 PM, Douglas RAILLARD wrote: > From: Douglas
 Raillard <douglas.raillard@arm.com> > > Fix the nid_t field so that its size
 is correctly reported in the text > format embedded in trace.d [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pZAxR-0001kG-6p
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix f2fs_truncate_partial_nodes ftrace
 event
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 3/6/2023 5:55 PM, Douglas RAILLARD wrote:
> From: Douglas Raillard <douglas.raillard@arm.com>
> 
> Fix the nid_t field so that its size is correctly reported in the text
> format embedded in trace.dat files. As it stands, it is reported as
> being of size 4:
> 
>          field:nid_t nid[3];     offset:24;      size:4; signed:0;
> 
> Instead of 12:
> 
>          field:nid_t nid[3];     offset:24;      size:12;        signed:0;
> 
> This also fixes the reported offset of subsequent fields so that they
> match with the actual struct layout.
> 
> 
> Signed-off-by: Douglas Raillard <douglas.raillard@arm.com>
> ---
>   include/trace/events/f2fs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 31d994e6b4ca..8d053838d6cf 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -512,7 +512,7 @@ TRACE_EVENT(f2fs_truncate_partial_nodes,
>   	TP_STRUCT__entry(
>   		__field(dev_t,	dev)
>   		__field(ino_t,	ino)
> -		__field(nid_t,	nid[3])
> +		__array(nid_t,	nid, 3)


Good catch.

Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

>   		__field(int,	depth)
>   		__field(int,	err)
>   	),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
