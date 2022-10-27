Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5960F4B7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 12:17:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onzxG-0002Uh-VC;
	Thu, 27 Oct 2022 10:17:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quic_pkondeti@quicinc.com>) id 1onzww-0002UN-7C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 10:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fG55fBexeMtPhT/uGjxoAaYENDzs4R3mS3BwVk01lno=; b=V/SXdKjupV9L0OiMBp4Yq/d3Xm
 hTcJFdH8kUvYjf0RRuIFoNXhHAFmqR4TI+4GgEg+6TRy8VEvEbWZVZ0owbjoHkPuUul7Bet2pBX9N
 F8dMC5vVDasHn4GNuwI7FlQWqKQ/gOSmnp3ahHNLVQxCjLHoFKP39vwLa5+D+8vzGxXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fG55fBexeMtPhT/uGjxoAaYENDzs4R3mS3BwVk01lno=; b=ZnLoaqkAsbCE2xLzYU2L7aovdZ
 xK68LkoPKyOmKyFtmYg3tDp4CNeu8Frnhne7y+4oG8c/YnrWh7qar3mWW8rHAmYnKf/AjWN8C5WaT
 r5oCcTBSXGhugeQC1phDUmO2Bt4kVeaCGAUb2TJAD1pygaX9FQl1kJgbfLGa8RAUjDCk=;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onzws-000079-ER for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 10:17:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RAA4nU005961;
 Thu, 27 Oct 2022 10:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=fG55fBexeMtPhT/uGjxoAaYENDzs4R3mS3BwVk01lno=;
 b=lxyVcQMAis70XUG4KeKD9X5U5E3/3SGpzWW21TH2wyx0bR7OceTPYS5hcO+U61wFjAK/
 cod6foe6UmFNzfkjDkEtHUQaaL2YhGWEyGP6N8pmxhn/8CSBKvB1UkrUOoUP2y9YJEw3
 Ol1Zk2D2pEWlUFY2UX4Rfg37fQ1m2/S5wjcNm3RpohdWqzORyon+bFLcZGdKi2X7Y5ik
 EYcKB39u+JPmoibZ/iDE+0aXwwgeOnE14q0tL1nxal3lC7eA8yxcvV61iDGUzHOK22lk
 K7xMfjWbhwTIKvrgp6wnz3VwrjHOXMkD2se6BydYgkuzu0jglDU/5GiXSZ43OtqJ6SCF ug== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfahvsmpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 10:17:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29RAH923023305
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 10:17:09 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 27 Oct 2022 03:17:06 -0700
Date: Thu, 27 Oct 2022 15:47:02 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Message-ID: <20221027101702.GA18823@hu-pkondeti-hyd.qualcomm.com>
References: <1666861961-12924-1-git-send-email-quic_mojha@quicinc.com>
 <1666861961-12924-2-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1666861961-12924-2-git-send-email-quic_mojha@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 67saJliUz5pFVmH7TQJNmzs8nFWWDG7d
X-Proofpoint-GUID: 67saJliUz5pFVmH7TQJNmzs8nFWWDG7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_05,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270057
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 27, 2022 at 02:42:41PM +0530, Mukesh Ojha wrote:
 > Data type of msg in f2fs_write_checkpoint trace should > be const char
 * instead of char *. > > Signed-off-by: Mukesh Ojha <quic_mojha@qu [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.180.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1onzws-000079-ER
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix the msg data type
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
Cc: quic_pkondeti@quicinc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mhiramat@kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 27, 2022 at 02:42:41PM +0530, Mukesh Ojha wrote:
> Data type of msg in f2fs_write_checkpoint trace should
> be const char * instead of char *.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  include/trace/events/f2fs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index ff57e7f..7fbfce4 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -1404,7 +1404,7 @@ TRACE_EVENT(f2fs_readpages,
>  
>  TRACE_EVENT(f2fs_write_checkpoint,
>  
> -	TP_PROTO(struct super_block *sb, int reason, char *msg),
> +	TP_PROTO(struct super_block *sb, int reason, const char *msg),
>  
>  	TP_ARGS(sb, reason, msg),
>  
LGTM. one minor comment.

Declare it const char pointer in the trace point structure also.

diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 11f6b71..22960e6 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1429,7 +1429,7 @@ TRACE_EVENT(f2fs_write_checkpoint,
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(int,	reason)
-		__field(char *,	msg)
+		__field(const char *,	msg)
 	),
 
 	TP_fast_assign(

Thanks,
Pavan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
