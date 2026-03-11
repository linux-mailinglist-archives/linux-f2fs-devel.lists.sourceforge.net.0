Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL7YENhQsWlCtAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 12:24:08 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F28262DCA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 12:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhTPabrGFOzX5GuftgHSNMeVKMJg8inTzDedSWHa7io=; b=Dwdzqsygx5V5aFO1x+DjnjlSkC
	klPwPP8bODeGWanyMCXiwSE86DRf2K0gRy5TEL0aSmXqaTuw2bXSQVgN+NukbrwBDdg7wwafrCot3
	8kDVmgY42QZpRI4vpImpidFnyWiMburi//TBBxq1zOvWQhl5RCXlfgf1uxx1jcVfBkJ8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0HfV-0008N9-5J;
	Wed, 11 Mar 2026 11:24:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <harry.yoo@oracle.com>) id 1w0HfT-0008Mz-AQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 11:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nSXgHFlonvaVEZ2o1L7FefWOlGjDk9hUvyqdHMR4D+o=; b=m/C/Fogxgu6YB78LYyzODoI0dK
 b7Qv5z9TAJVSHcJA+UWuFVj18/9gj2LcGOPfPZ10h+TvVe8WpNMBJU2BxRsmKUMaz8Sb+/T0KUJ++
 ERHJlM4wQf99pj7GJF+TlDWybV11z8jWTEcsySOW7D8u+7OSKKssyz9Q7wQYTyn5Zu5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nSXgHFlonvaVEZ2o1L7FefWOlGjDk9hUvyqdHMR4D+o=; b=KA6rT3MgjGVazDkhrGp0s5ymF9
 3VKrsRcTQsXpbalDWwVy0I4SH4/J99KsDFC8RPVUXH8XXArCOHtSccvRgTGJlk+65DuYw29nIHOkl
 qL+aSKaoP/+oZAyNRGV2dwHlkifYXcwMj3fyrSTpIbqPHrgq8i7YFKh5TMPR3+GyG7CI=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0HfS-0007jQ-QC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 11:23:59 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62B8K7me1398447; Wed, 11 Mar 2026 11:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=nSXgHFlonvaVEZ2o1L
 7FefWOlGjDk9hUvyqdHMR4D+o=; b=MSs1jmprbsl6QjkJqwdWD7txuKbepx7tM/
 zAi1POcaH6cM3ZKzzREK8YZf0FKp1IGIrydtBf0ZuInU9XKxlesaJGBtzn6YcaDL
 kJqJdkjOU3esmoYcYKhwEa1UoYAuA/PgEjZtwLGO7AKEDt83tIjRzAkR72zB5Bxy
 8NnyzGMYgsKiBmwpyIltNoqvZG+v/svswcscL8PrnIqSjoj5zmq0MdZvPu4sKAKf
 OY420sGk8qs8hfzXty0wvL1znvGp0Ay3WvCwbzb+kiAl1lMBbheFo4Mlc/fdE881
 hN6ZWKuBj476SF2SxSDyxyjTfp7XzJTb/zGP9js9inWyL3yY1eug==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cu4str7jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2026 11:23:42 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 62B90FOB039620; Wed, 11 Mar 2026 11:23:42 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4crafbf2qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2026 11:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZLm1EkS7Mev2JcLGeY44z90hFPk7nLrGDkNbXeXfIYIN7XHQINOaY7KrfC7AVZ/U944EDkii4XNfXpgP5onuDLYe+IdEiqrzl+xgjC9imv98dgxrG5nvkBrgKurxKgIEscEA7EyU3b4B1LhZgFXIbRpkV9I245MBEhP1VWIwouAG4meKhc0+pHOfbWwnF59VfjJ5sIywZCBe/ECybgk5dYpsuIqzD/C97KFL1bzoTDG4hEhfPPzfOlNPzdmJFTOPWOJhvGIh9zUFDbH05o+smCf7VPARJpHRKvt9cstKvH5Ntjt+CUs4kvf4kzyStiZ+ydkFu/MAKTN94dkVre+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSXgHFlonvaVEZ2o1L7FefWOlGjDk9hUvyqdHMR4D+o=;
 b=bR5Rw5bvpSvtlHbcc0q+ReDiV2XaPSHQJvt0J5t/UimwmuB8Ms+4miPBLVdCREfR31v0+UyGwWFax2thWwBnk69fw8Ypmhm6CqhsUTHTvHn7twgWqFWMUIMyRAS4gRtUVS3Cq31iLqAUO5hF1hHLg2pCdBpQhVdvfqQaOfk2Hyg3M09i3nYiFKRlg04dHwVg06QUfmJ9y2swVYj5C6PgPWKkbPglgnGfP7NIgcfDLX/Rz2/S4en+pJda/Aufm9DVZmqhJXnaTfo3TaJkH8Kvd1UnpqG9ZsQSiFCUF0wq+W4stS1PB1LOr3gI7ybtaA1m0zjps6Lz0+ChFOhTRb8Jmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSXgHFlonvaVEZ2o1L7FefWOlGjDk9hUvyqdHMR4D+o=;
 b=qB9u1HsANtMrPDfwfMsGsOEEiY0o2IRJIm/S3sSFCD8R/v083OqnU7K/zZb+NoJlzn/x9ThP2zbmZ3RSmHVF6Xi8N+3l4yKzsYF0yLFZQaCgetxHYe1nHvA48kkZ4Zrw7Yc9tX0Y5dW5IPOsZtHMdWqyLDowiZVDua/R6peJPoI=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by MW6PR10MB7549.namprd10.prod.outlook.com (2603:10b6:303:23c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 11:23:39 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 11:23:38 +0000
Date: Wed, 11 Mar 2026 20:23:31 +0900
To: Qing Wang <wangqing7171@gmail.com>
Message-ID: <abFQsxz6pp8H63Te@hyeyoo>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
 <20260311104855.102050-1-wangqing7171@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260311104855.102050-1-wangqing7171@gmail.com>
X-ClientProxiedBy: SEWP216CA0030.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::18) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|MW6PR10MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: be1ca5cd-8233-4a8f-cfed-08de7f60a443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 02djn0tjef4OYP+yy8N1ojGS2QnlUAmBsSqj5oGQuTV9eM+8NAAx+CytfhFxPZhiv9GBe47rRCZoNGa/de4JHVvZeeUijxvG4gJ/UdcIno96yx7e8GgwUGZS4DE2MtLNv7xDn+BgQKBOwBhpsJNaWKScX9JbCqp2xskZRSexAx/LsAYeWGT6AoonnvXBuNdqQ1gLj1YL1FxDnFBJNDRlNnCAMhVT8Vc9wVYFioaCSQejzpOMmqHnfSQr70viopUVgC242L5/aWOQ5YPkbtH/xWDiQlTT1ARtOH15rtfBJC2GLbrzrnSUx46zQ2EXHaaYK6kB5098Gl2MOW+lb/4doUcoKI0OQQkDCHEz3CeW3/lRHyWMI6+dx521e4uYXPSgDxC90iUyRMO1SUgzGvsk1RAqcmVecnsS6R0f6b2IcqdFmwh7H8otHe054yf4zlEiWGJXBILEkExFRWeR/Z18DZD1YMdcOlEu28FY5/jvRBN9ZGT6WWeZFM6pIadlEdniG97AlA6X1aV+hXnwQZKSW8fcR7SwvLWG8V6/HUfOK+/PCWqvENZNZEkAUOrFA/iI8zuXnPyfA07RJxLlWVNs9wr1wGAIsGWYDojjqAB4jhBOdkmgwdqgYU40DPEpe8wyLFiWjkvo2ndfxHjTXOIo1b5B2fM25QZ5ulGhWz7Hky7LNy/KwKfnihgANWjZBDHkRsFABHYJ8PTc4gOR6gootdLoalmAOH22n2o4fe7sKsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB7329.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JI0myKfPmKFl1GqWi+APOh3DA2PPHWB5lxgYBmdlszxudyH0NljZ4xsIY76V?=
 =?us-ascii?Q?WG2xbRHQqltuYnthqmXPmsmtCe0GqsxPPoREjmvlrU7P9ZhK+pQBjOimqavT?=
 =?us-ascii?Q?CoFNbO5Yv8kXTXExIwBf5B/3GCPYNY5C58iamKiKqTQJ/G4z1OyX/VgMdE2W?=
 =?us-ascii?Q?W1lFC4gepO+jNPtwcuFbxtz9wHNnvrDiBrs9UC/t/IG9nstuMLcx4/QJQnDT?=
 =?us-ascii?Q?u4EoB9QfxhApP6ZG3nn8Znh1biRNadrM0NvfPqsuapF0kfdF0Qa3UNECfn4u?=
 =?us-ascii?Q?1VLAoPpWx7BVgjxUiHKF/po1W8kHHpbUsGiFV0S/QRYnB6z+dX3oeRrEyK6s?=
 =?us-ascii?Q?cYfT+nPHdekPVbJ0QS6PlYddYVcU+Xl6syZyUD8NL94KuK9xOz4Sz6zsyoHS?=
 =?us-ascii?Q?O2hF7kwEXi8t8Ee7fMEGbJQgWHbCZgVIvSnVZ1JjuvSishjCLAZ37e9jELTE?=
 =?us-ascii?Q?bysJ/IfytU5qPjD6KYS8hyAfFKB2Ul52V125G5C/ZDHOHrK3E4gBArBgfMOD?=
 =?us-ascii?Q?TLOn2W5izkk1WpqY0xsFJm4nnHEqWa3y3T8EwhIgW1Jt1ryQsFKMZjBisckG?=
 =?us-ascii?Q?4MsqB6FZioJ+4VbSLHrGp0BbBIPNlmwDNietnSTCD+EOD2Z+9bxw6tOBn08d?=
 =?us-ascii?Q?HuifE7GNr+HuhNJdU9HL22IhwIg9JEw898OqiwYUhRl8SkA1o+pImwEAy99b?=
 =?us-ascii?Q?5NTF/8pTazS/oaWOE1deIU+Y6DgmMMyDIveloayOvMfZ1ojVqUdvF3KoyKFh?=
 =?us-ascii?Q?aRWd8yalIWm0w3fQntyLzKD8u37jAu61w1w4/2LcuIEZzDH7KABh905VOxtw?=
 =?us-ascii?Q?pa9NYtLs+ZR8dPJQJlWBXj1sQ+RpQvgEvMqU2o78Be2S9KWG6AYlRIWpKFHz?=
 =?us-ascii?Q?1Vo1Kt/DT5x9kRcfp74bJ2uKhYG2OVvGOkuH6osKixFw6o0H+eUGCXS1xA8A?=
 =?us-ascii?Q?6K883wdtuYZh7PgfXbA81jfMKm3dYE4+AGE+PeE1GHpwfmKZAiJN0SsWK45T?=
 =?us-ascii?Q?a0VYUgAekkK29rnP83+20F9rJZaMZPafKATbRmV9ZEsWk0ECsGPIJsERiCAV?=
 =?us-ascii?Q?l7iOCmraSTfBH9A4OzsrhJ/Ld0ysYGbymnOMAfytZUQsRCTZ3NEVWnqjmw91?=
 =?us-ascii?Q?HQjHqbAduTa47TkKkwCNHam5t5rGJ6412x8lbH9Xv26oYKRhFhuwm0S0tBqG?=
 =?us-ascii?Q?xHsl/+LsJLgM1DM+GzfglcaMtCVL47iJ6uH8ZYzu7KFdKWj4RPPlPszfOh2A?=
 =?us-ascii?Q?KE7EXjVSNVXxuVa0GoSTWcp5RYvK0uUHi4WmfryuN0UqArSejJHkurm8rt0Q?=
 =?us-ascii?Q?Xx8ot5/Wa9AlFdNwGsq1cC9paZlzOcavKXrFpUa3yo46rq0l7AyVQLj9ji6e?=
 =?us-ascii?Q?X7uhuSxLfsELMLo67i7hfcGrUQ17WsPjgK5x0Drjfzf5Hv+3hPtbXI6LNpkA?=
 =?us-ascii?Q?OrKXIcr1PgYtNSWlOeTEUEGqFi/KliBkIStDFPrx4medkmiRr3AlxTbk0Qd8?=
 =?us-ascii?Q?qIh0x3ure1T4Op+wLYHXvq6dWE8oBkvsJBD9+JkWY68kAHBJ0ZX+7YmSZe9l?=
 =?us-ascii?Q?5con+Hs9Mptj6kxxN7qzUcxOyYQLJKqJlawABrzMYxAFhwcSu/zH3vb3PmFk?=
 =?us-ascii?Q?5S8qo4Z8JlUWYkgxW2OpXSo45ju5ZW0z/2oKTnMcbXGu7dVh+Qn6SfKdEi3W?=
 =?us-ascii?Q?wmGgno45+20COmXvQ3L8HYlUR2PeHmPeXPTCe1dCKok3R6YYDr5YgoKVBmOi?=
 =?us-ascii?Q?q9GWkRjHCg=3D=3D?=
X-Exchange-RoutingPolicyChecked: IUDLyR7RVY/uTMxy8trq2RBF85EPIXvjcOZWlr1HsMXiC1Uu2LVYyPjffQc6zG3rnOUk9/af4aqbDzQ5w6pVDV7FaJhZYiZJUuSe43IN04DZotu5Nm2QG3muikwf7t1phA045EfvQzbo81tijlUQwY+/glC96b9oq5tCanX+wZQOqxl6WLfQRS8JC/tqQREdGL6yQ4hAGLZKCRNg3YJ/2NmD7nse6TvT8xgs+unfYnCakOTTat829kicTtd20DNrKQCQDxzTIAeVLid5FjRHCkZdenrrh/LJOwt1soYJaUJoFZMGi0zrZIlbH3pNRqKDlLTMVCnGsWLgLAiSkFr5fQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TBlbFH+1NHLybmDrra7IHIjPRzoyAe6g9hxM0QClqyaN5vXvuumjbcSKs2MRDKMH5ukzbFTuy5hpbozJhL6bRCIfOo+eAV59zxyWWc/9JkiyUIapBzg+VMwCKQSPFk3bWjHLMyR5Sk4+e+2ICDo+YXEYMvDndPjY+KnHH3OurULaf7qxba/ng/IWrWnMYTRs1nwl8Y1KmKDIgK3nSLyInBTDL3487+OPZBjsjJdvw8GPnnDRUm61JqagwNhhC9amHKbuGA+qo3sIWTz19QTPz/wTrHsxBk15JmTI4XIRro3gYEeI9KsKYhQKjPnmYRlZUus+VvuIyfslJ+s4FME9TxeMxyq4xXsaDT8PB94oT6lr81Im/99a7sG/sRN7ECk1/TlaVZ0c5N0xaGriKD1Gd6U97fTgtLe/Bmi9n1HirQEgcTPIhajKXBXEs8aIs385dq7ywbG0UwoHReGMWHij4l/6vWZpWj0yLDdgP/r0+CPrUCvReysQnqSXj691gvVMglqFOiMvy+Dpi8MW2ro0C73FTDNyCFl2IcqmUmqzHk+CKNmHqxlL2EPane/C4OCYtGO6B5EsZOuS7pd0nAppMYzweDvzG1vxhCBNSS6ATNY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1ca5cd-8233-4a8f-cfed-08de7f60a443
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 11:23:38.6260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9yd/nGA/BGl2GbS4i9clVnao9UEYAyxzHqDipi/yEbMHVtPL1cy8qvuMwM5sBxBD8KVyXcRWcu1Fv/Nlye8VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7549
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603110096
X-Authority-Analysis: v=2.4 cv=Fv8IPmrq c=1 sm=1 tr=0 ts=69b150bf cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=Ef93L0gbSnvVx2YvGFEA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: JRFCWYAn0fOn7MTCGCJDUNsbPgq5kg2f
X-Proofpoint-ORIG-GUID: JRFCWYAn0fOn7MTCGCJDUNsbPgq5kg2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA5NiBTYWx0ZWRfX6npWWazh5mlF
 TOM9EydbzzTTPqwjJNNw2AmJPY61dSR9hfqFyarIESqNptcWjFcApSqra2YzhAzqdXniN5V74T0
 qNqXNBa2u+OFiyeFMMpQQrNKu29yCx1wtp2zhK/AYzYVb6jSKwQhd51xFfTgE4anfjeo3Io+jJ8
 mFz+mKsxge9U0ppI7xDcpU7dd5Sho4xoFRbu3aQOjuCLJ7IJZ+1poEkQGQraA8UV03KVLoXGr8T
 3wL//EoZ6+qKuOpsJp4EqtJzBQcvDSw39WNgCGGo5JOF38EtgHz4PkkxLIClEDG05jowFGRMBgY
 xQyq/o3+7CCxeJ7c2QOiTWRmLIRDeNPyxSBifYcHPAvzHgUp+qVCuyASXoBb0a/5VzAP8YewVEK
 9RRvGU/pjEbpMbmiKL0KB7DMBqf1J8uCp6vp5SBKJCY2HcODvxZHaw9mKfAxNCe4qczo2MjJiSk
 gYbjCx+W83JCqPrmDPQ==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 11, 2026 at 06:48:55PM +0800, Qing Wang wrote:
 > #syz test > > diff --git a/mm/slub.c b/mm/slub.c > index
 20cb4f3b636d..73b2cfd0e123
 100644 > --- a/mm/slub.c > +++ b/mm/slub.c > @@ -2797,6 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w0HfS-0007jQ-QC
Subject: Re: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
 __kfree_rcu_sheaf
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
From: Harry Yoo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Harry Yoo <harry.yoo@oracle.com>
Cc: sj1557.seo@samsung.com, lorenzo.stoakes@oracle.com, jannh@google.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Liam.Howlett@oracle.com, syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,
 linux-mm@kvack.org, pfalcato@suse.de, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linkinjeon@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 40F28262DCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-5.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wangqing7171@gmail.com,m:sj1557.seo@samsung.com,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:linux-mm@kvack.org,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_QUESTION(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:replyto,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[harry.yoo@oracle.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 06:48:55PM +0800, Qing Wang wrote:
> #syz test
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 20cb4f3b636d..73b2cfd0e123 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2797,6 +2797,7 @@ static void free_empty_sheaf(struct kmem_cache *s, struct slab_sheaf *sheaf)
>  	if (s->flags & SLAB_KMALLOC)
>  		mark_obj_codetag_empty(sheaf);
>  
> +	WARN_ON(sheaf->size > 0);
>  	kfree(sheaf);
>  
>  	stat(s, SHEAF_FREE);
> @@ -2828,6 +2829,7 @@ static int refill_sheaf(struct kmem_cache *s, struct slab_sheaf *sheaf,
>  	return 0;
>  }
>  
> +static void sheaf_flush_unused(struct kmem_cache *s, struct slab_sheaf *sheaf);
>  
>  static struct slab_sheaf *alloc_full_sheaf(struct kmem_cache *s, gfp_t gfp)
>  {
> @@ -2837,6 +2839,7 @@ static struct slab_sheaf *alloc_full_sheaf(struct kmem_cache *s, gfp_t gfp)
>  		return NULL;
>  
>  	if (refill_sheaf(s, sheaf, gfp | __GFP_NOMEMALLOC | __GFP_NOWARN)) {
> +		sheaf_flush_unused(s, sheaf);
>  		free_empty_sheaf(s, sheaf);
>  		return NULL;
>  	}
> @@ -4623,6 +4626,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
>  			 * we must be very low on memory so don't bother
>  			 * with the barn
>  			 */
> +			sheaf_flush_unused(s, empty);
>  			free_empty_sheaf(s, empty);
>  		}
>  	} else {

This won't fix any kmemleak reports because kmemleak couldn't detect this
in the first place. kmemleak doesn't know that those objects exist
until they are allocated and kmemleak_alloc() is called for them.

-- 
Cheers,
Harry / Hyeonggon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
