Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8BB9006DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:40:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFalh-0003G6-S6;
	Fri, 07 Jun 2024 14:40:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFalg-0003Fe-84
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lfuBYEjC3Bso2fSI4L6QpuFe97Xlh1NX0HFaJB0ytJM=; b=l0Vn4umyaUVLON7GTRMpywbMb8
 Bwup/lhB5G0dXMPvvZfz8x/yJDhePcE37AE7Zh2Z/OnoaCBSia2sldM8deBv5hw0+4dGFynUxZHkx
 an1kV14E11MSMFsvih3XRWs3wZ+/qBWiY63Or1Twl5f6s5MS4tOMpx/4E/4MB/SJ0myg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lfuBYEjC3Bso2fSI4L6QpuFe97Xlh1NX0HFaJB0ytJM=; b=Dr+76Xq93ml1LlOYcjVu6TcB0b
 1rtA+PQ9SzGSfDbimxl+unl12FW8I07wiW5LivkFff8xk0WKbtZxZPltEKQybxSeKah3VL1+8Xr+9
 3+Ll8+liI8cAd0isHTYjUTcxFNN0jIx8s9mj5ZMML0hmmcUiqLK4RCEGMUPbTHIfnr4s=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFalg-0002yL-GG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:36 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457CuVoX025439; Fri, 7 Jun 2024 14:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=lfuBYEjC3Bso2fSI4L6QpuFe97Xlh1NX0HFaJB0ytJM=;
 b=Vzm792vQ7jRFG4+dr8biW8Zv3v2AMecX8OFSC/LCyMj2l0wktL+jjuWZaOjfPlLJ5anG
 eW8yOHCkW0kPgBh4pivqJZenb7p0S7jkD1AK+7nAS0yRC3AHZS9zbb2koD5EVEy2l/xb
 RFXUkSeT3TPt1mKSbWHPDtZpTnoP7+sKAjL0wzwtIDvzTV6KvFnh6AbgBo7rk6/03+Ef
 SFMK+swczNHBiwnWQ86tBHAgvb42JAsUZrdgNkzASmX4a5+G/EMYGYK2DHucag5yfVZs
 bx67tZIPLQVU+p38ygcU0YhahH2WJ34+ky4dJjfqgJ9hxM8enl7AEjdT9HAetZ2dwf0Y Fg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ykrtb13dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:19 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457DXrxu023923; Fri, 7 Jun 2024 14:40:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrr2abu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRB7H+pjmW7EiHl6ExXaEhhXeoPhWxbppU3/tG7WQyG736leyAYE+q9fDsyFBJ7dfJufQ/Wdu5SJXiWejPWnl1M2t9JQanQb90R1jFAd3bStMestvomsbS15xNHwRqUxs9SL9g6z7JB1gVuBgjPHpQFobqvSJD8cKjqhrfv7IsJemaj7tg1PZTja4XoBcq9fyR+VBlJdaV17aMp6zmBB8k/m81FI1CMdBedsto725G2bFH2KrdInr110tZkywNZyZ4Lj6g+Vi+wdMI+BDuqypk5iti3oSJJq3huD2K/9rEHjXKswS5AR4uAKTv2YvtYDQOsMg8A1bIlr6JttnaOgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfuBYEjC3Bso2fSI4L6QpuFe97Xlh1NX0HFaJB0ytJM=;
 b=e6JZMe02fR0j6z/BWeJFONk2SVRiDjbkQwXg9H1wZilNbh1cqFRmTXVWNwfNgI1KSrublIhU5aAUCFLYjoHfveFb+CqE39WE+hKU0VzovBz7JcPNV80g/ciTyAeodVQUWaUleDK/8euj6TRY0YKLU3d/AasX+iG0LaTliWgh4sAaYNjMeFl6mee1Fgfl7UpgyMn0+266Ly2COBLfzQ5/NqGlA4yblRo2cgNislSyQFZJGd/5mag98d4LTAb49HKv9+MA5UpUvBdH7C9OvzHGk/cWWRVe40sAfZSbdEdwmH4dMJV5ap6J9n5YF/MJXWdUfvcib+hzPUduKb+I+Ty13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfuBYEjC3Bso2fSI4L6QpuFe97Xlh1NX0HFaJB0ytJM=;
 b=SEStA6FiTqzvdupFz4Z1zIAG2EZnFhZPz8ZknYk38fe+k9FAM4A7ENAEL83kaqh1eq37hv1qmjG0o9vQaYaJrAx9w+CMOEt2xq/pzqLpMGgVztGwf0Ez5G66HW5TbnqQQlsZpYtCBYSLKWfvl2GvsjiCa9r799qz7tE4aOOjEOk=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DM6PR10MB4170.namprd10.prod.outlook.com (2603:10b6:5:213::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.35; Fri, 7 Jun
 2024 14:40:16 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:40:16 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:39:06 +0000
Message-Id: <20240607143919.2622319-10-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240607143919.2622319-1-john.g.garry@oracle.com>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-ClientProxiedBy: BYAPR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::14) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DM6PR10MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e63533b-b661-4124-caf8-08dc86ffbef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xaxqLbt2lV2Rwx3UP/YgjVj+OfUV+/FcXrolW6Yw6jYuJh9/H3VlmjVFq8+7?=
 =?us-ascii?Q?PA8/MCsaasyGYAYyTdlDfpRbMUXRJOUA4VEtH33B9lmtXfWXQiL+doIV6gJv?=
 =?us-ascii?Q?5/jnD1wuNnF+lTbOoQkqL5xDcpAwe5EmGCNUxCR3eWHTqF4pA8qNoNyE55Cx?=
 =?us-ascii?Q?wMaikx+g5EUn5NJLwQr706pSx82gI5dTtWxbrpSmoTAceBznFGy4fVcY+rg7?=
 =?us-ascii?Q?Hg7suTWxzY64+dt+6+w9amScLXRWS4pgmqJ41KAyn0CqbcgNObHEP0ehDD6f?=
 =?us-ascii?Q?1sPV5jTBq/T1NgEPG5psvnTCp2E0SzreeT/NaJZzx76l/EwRgFMlIkS34Niy?=
 =?us-ascii?Q?IXa8szxx/zMSifbdvbJYdCww52/UrITEvRoiiMwDPLzKvjQEXTamZ3zHTHJN?=
 =?us-ascii?Q?OACBkByb9MALrdHU/dXr3MAf4T42ptrvMJq1lt/vxtOff7y7doMgSO9e3Xg9?=
 =?us-ascii?Q?gxxbFGv2iE8M8DzFq2rr9KCvC14gqX9yHaylBq6zAbd7H4p28S/zN62XjB52?=
 =?us-ascii?Q?PJ5I6zkUUnMpCL40k1JN5mylz1FiS7bfnLVm2jzuEgOcCO/j+rsLHu7E7GpY?=
 =?us-ascii?Q?M31ZIe5z5R2ui/l9ejgAu8iMtZ4eCvAE/E/Uw0GLcHblSRDybCUx8BiAAzgt?=
 =?us-ascii?Q?J8+ijEo1c4X5ulSipV4cUrIF+CydqBhWddkAO2aeM3cOjJanwD0TCOA4ON09?=
 =?us-ascii?Q?abbO81hA+i31XIzCc1jMTulHB9TXBdGKfY3UBFQY9B2Bz2vzLxfZydqJyYR7?=
 =?us-ascii?Q?uuHGkTKmAkD0FiaMpRmtHcFYAYTAFiQ7okbxcgxv8JcTrlpYbU43wvZ/l83Q?=
 =?us-ascii?Q?ookPvVUXZXZiBwk3PEBOg9wiCpvsFNqpSNqO4NyPhn/FRV2MOIosQL4z1oD7?=
 =?us-ascii?Q?F/xRPU4R+2Vm4Rlt8Lnsm+324IBNlsksNhJDR8GYTgFzPObBJSkWZpWIai67?=
 =?us-ascii?Q?f0cfFtw9EFgX9TocacV5CY01dkesoxYMhfB91mG0Gm9r14Wo6+wmz+BqUQnG?=
 =?us-ascii?Q?w0oxrZDzuFw36haexHQ97Ya5SZb6sRSK48X9qeeLKeFImiDUMDOzBob08bBN?=
 =?us-ascii?Q?8Kg/UWYp7LB4jTbgi6DfHpOh1MZ8CwuPqkMvqM7QLa4nSq82VHumF/otnONw?=
 =?us-ascii?Q?Ns0+dnULeIHzTgFu5+SoBdRXtxRLSr+MQsQkCoNMtubzVdpZRaFd/k8nAP18?=
 =?us-ascii?Q?hwo5EeNcif06oPxiT3W+3S8c8VnJSenil+7dvKlRAmtqWDprN11CZb7ABNkX?=
 =?us-ascii?Q?L+wbHrEf60cnMlrizVH6645O5RvM52Y9lKF7UxySg/vVDesKgps57EwnerZ7?=
 =?us-ascii?Q?CHHGOyymZDEltfT80Sqy7ueg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2h/50Ap+qG8ouuJHYJ7JBGNzP/g6KbRk0twRIJZgvx6hc3lRLPy0pWzSBnKd?=
 =?us-ascii?Q?TgUjVOoKOHJFqAww6U/byfcrQPwe2PLm2vDGrFWLt7v0nUicT2FKRJiAREar?=
 =?us-ascii?Q?0/hQMbTbsvSq4lysSwO74jG9icAI9vw4P84Rskh38rMmXZmfcL7+Qba3lzwR?=
 =?us-ascii?Q?yEq9QQEXkvNxVFnMbpKg3CfwPYVQaRL/Fl5cc3U/3KuPLZ1aqvoMQPiR4CGr?=
 =?us-ascii?Q?jmSwCL/WsTfutbazhzIIWWqXiGUB2yqJoeT4DEyZLNMQoOGbTVPyLRpw7O9v?=
 =?us-ascii?Q?QD0UJxKb2O1Y9Zhs6yBYllFaSH9CjhdInXc7nJmsPqYpTUdBkMnsm5Hqc8nk?=
 =?us-ascii?Q?jHSelhVGpjPi6C1K/KxCMNuAsoDuryMGukb0+t9uiXx6YMiZLfJiEEqiZdkp?=
 =?us-ascii?Q?4hSWxYefR/pmso21T5OOK1tH4NCt7y1Cdp8K7o131q6zA0jVUfZy2+kIbOEA?=
 =?us-ascii?Q?zlfJb1YLUJFJFsnwjfuoOmdAbdX3k3YSdxaOPrw+a5n4PXkS8h6DW7CqN4L2?=
 =?us-ascii?Q?60N3uzkSi31Dg5BDwcG672tGtXV9aFg3Nzqf6hUA/yhXAgA/K380VCoYjgeo?=
 =?us-ascii?Q?x4/c5Q9VAugrTkmAtTSHbnloF4Rq5MmF9HFag91vywzWLmX3ZE8ZhcnNuW1A?=
 =?us-ascii?Q?Hxbq5MbMXNVeP9QXhTo+RMqQAi7/cfQpJiSkeewgaaRJcj4ZPBiAKgIgmiBb?=
 =?us-ascii?Q?mBKFiT8IBlMz2vVPnMtzagYsYXcB5I+6W5bi8eEA8VXFfeFFzuvDW3a1dsvn?=
 =?us-ascii?Q?0SyXIKkQPY2D7lRAfJmU51DZy7ECQthlHFvkyphfX8vCF9HLK9q8OrWWmJUF?=
 =?us-ascii?Q?T9RU8i/f1BU44nS5Y2E3X2IBQDIYUpo3pXf9oJFgIkUUtVQNDTgbRopfABcm?=
 =?us-ascii?Q?IHfHbgzHwKiNqfUz4pqnOFC5M2g1icOOjTWft/uXm1N9hKrx3GovmdTvDmxu?=
 =?us-ascii?Q?5ba9jYvV2Ual6UI5Hs0W2dPG0BzIziAY0UvVgtk3OvRr5YWeXOyjCeVDo8YU?=
 =?us-ascii?Q?+x5BV1bGVdJSH1ilGkqhu33gwHRLUbnm/rxvDnw+zKJHv7RUkmy51DWgD/TB?=
 =?us-ascii?Q?0fWzU0iiJQ8MxxSY8YS1aY8rqC5nI6dttpL+AiqRZWVOVXmTEXf++N1nAXxO?=
 =?us-ascii?Q?G9V/ahjboU8eiW2STWzfZ4uMiS0RETB+6WakYE0WkroUJzBAr3J4uGx5QOoK?=
 =?us-ascii?Q?I0BK9EEK4UBlh3tKfQdvnyvb9nHAhUQUApcPVSnRffrilCherb4MRrxwp9SA?=
 =?us-ascii?Q?8a4sffud5awxKgECfav4fqBOl2bBzsMReiJX11MClUWZ4jakD/yfywjARcMQ?=
 =?us-ascii?Q?eDNtBmKp8zZIojcXneCAmVGgUkm20GN7/Hwc7qfhaTfufbF11kVXdS7AtYaY?=
 =?us-ascii?Q?nwHKDykgVFzRvuKb/8NqJHKNOpL0Q5mZU2LH33stX1fwjjauQw5EDkXJuUGD?=
 =?us-ascii?Q?5WOXygFHKKbIUhPSGoYrW/haUXga5lZfNTD+cm/YC/JyQRb316qZhYSezBwk?=
 =?us-ascii?Q?Sl0nXU65JPXP9TqkcBiAXdc3w5cbR+IPRr1yANo2XjkblJx7WgAOSIYfeGXX?=
 =?us-ascii?Q?O1tM6OmlnxkLt3BhuNcNjoe7fuOu93+5Oqaorl/6X3M1QzyVQsFjJlL0t4Vb?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zY7bseb4HIO70i05ulauXRJSxH6Mcoiqp1EyaztBcbIsY2Awb6wfETEfCZpd1tCncRi3v8QRApLGlbHxtqTzcZa/xQlNa1CsNgVyiRLo2GwAvQoBOpAOzYJvtmw1Afdwk5RySJuhRmaD9FrMkHFVQ96dVLZVen/3rddUHzdJFziOA0aU4M5W6xK4dMm1nXVYazYr/Fc+mnBYaXVzwUChbOdz2zWTkxtz2YQJkVyOHaQTRTdmZuJrodx7xE/MW3bCpCiMQL8C47SuZoHch00ghzyEVXF9TPfB8hewS/zx1jZE1AW6p87aAsRZTnhTM25RUpb7JEo4b7pi2tHeGD+Y+6ESRGhuOcQSMhN8cn7LXF87NibcRtOCxkt4G+u+7Pixtl06JmdglT04/SVRSkHYPCUAU1yo8Y87pZn4QJqjEv4KqI7yJNf0HEXfh8O7TCdsjG4bE4sryMjQyf93GWejIiapO1zDKcGB8wC4Hzap8znPxWlAcm8xuH/7YSl2y0T6AdtRLm8yzubtIOSixhiwy6Fkrp3n8179O5nmutF8arjv7hdQM62sLBubgcgAzu6Uehaw0FByEicrR2bsW1+Z768n/FiknHoziJuDS5WUGus=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e63533b-b661-4124-caf8-08dc86ffbef1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:40:15.9413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mupQ8RaSlqDQ9W2QJURz9vBjGn1AZqqSzct/2GhFHf//jTI/w22x2l7rqTfJnIbgAyNyEziuGaFaw83gkNV5hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070108
X-Proofpoint-ORIG-GUID: lwsKQw7EoQ0cHs0bDDnDuOc6uptQsy53
X-Proofpoint-GUID: lwsKQw7EoQ0cHs0bDDnDuOc6uptQsy53
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Dave Chinner <dchinner@redhat.com> If args->minlen is
 not aligned to the constraints of forced alignment,
 we may do minlen allocations
 that are not aligned when we approach ENOSPC. Avoid this by always aligning
 args->minlen appropriate [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [205.220.177.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFalg-0002yL-GG
Subject: [f2fs-dev] [PATCH v4 09/22] xfs: align args->minlen for forced
 allocation alignment
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
From: John Garry via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: John Garry <john.g.garry@oracle.com>
Cc: gfs2@lists.linux.dev, catherine.hoang@oracle.com, agruenba@redhat.com,
 martin.petersen@oracle.com, ritesh.list@gmail.com, miklos@szeredi.hu,
 John Garry <john.g.garry@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 mcgrof@kernel.org, mikulas@artax.karlin.mff.cuni.cz,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Dave Chinner <dchinner@redhat.com>

If args->minlen is not aligned to the constraints of forced
alignment, we may do minlen allocations that are not aligned when we
approach ENOSPC. Avoid this by always aligning args->minlen
appropriately. If alignment of minlen results in a value smaller
than the alignment constraint, fail the allocation immediately.

Signed-off-by: Dave Chinner <dchinner@redhat.com>
Signed-off-by: John Garry <john.g.garry@oracle.com>
---
 fs/xfs/libxfs/xfs_bmap.c | 45 +++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
index 9131ba8113a6..c9cf138e13c4 100644
--- a/fs/xfs/libxfs/xfs_bmap.c
+++ b/fs/xfs/libxfs/xfs_bmap.c
@@ -3278,33 +3278,48 @@ xfs_bmap_longest_free_extent(
 	return 0;
 }
 
-static xfs_extlen_t
+static int
 xfs_bmap_select_minlen(
 	struct xfs_bmalloca	*ap,
 	struct xfs_alloc_arg	*args,
 	xfs_extlen_t		blen)
 {
-
 	/* Adjust best length for extent start alignment. */
 	if (blen > args->alignment)
 		blen -= args->alignment;
 
 	/*
 	 * Since we used XFS_ALLOC_FLAG_TRYLOCK in _longest_free_extent(), it is
-	 * possible that there is enough contiguous free space for this request.
+	 * possible that there is enough contiguous free space for this request
+	 * even if best length is less that the minimum length we need.
+	 *
+	 * If the best length won't satisfy the maximum length we requested,
+	 * then use it as the minimum length so we get as large an allocation
+	 * as possible.
 	 */
 	if (blen < ap->minlen)
-		return ap->minlen;
+		blen = ap->minlen;
+	else if (blen > args->maxlen)
+		blen = args->maxlen;
 
 	/*
-	 * If the best seen length is less than the request length,
-	 * use the best as the minimum, otherwise we've got the maxlen we
-	 * were asked for.
+	 * If we have alignment constraints, round the minlen down to match the
+	 * constraint so that alignment will be attempted. This may reduce the
+	 * allocation to smaller than was requested, so clamp the minimum to
+	 * ap->minlen to allow unaligned allocation to succeed. If we are forced
+	 * to align the allocation, return ENOSPC at this point because we don't
+	 * have enough contiguous free space to guarantee aligned allocation.
 	 */
-	if (blen < args->maxlen)
-		return blen;
-	return args->maxlen;
-
+	if (args->alignment > 1) {
+		blen = rounddown(blen, args->alignment);
+		if (blen < ap->minlen) {
+			if (args->datatype & XFS_ALLOC_FORCEALIGN)
+				return -ENOSPC;
+			blen = ap->minlen;
+		}
+	}
+	args->minlen = blen;
+	return 0;
 }
 
 static int
@@ -3340,8 +3355,7 @@ xfs_bmap_btalloc_select_lengths(
 	if (pag)
 		xfs_perag_rele(pag);
 
-	args->minlen = xfs_bmap_select_minlen(ap, args, blen);
-	return error;
+	return xfs_bmap_select_minlen(ap, args, blen);
 }
 
 /* Update all inode and quota accounting for the allocation we just did. */
@@ -3661,7 +3675,10 @@ xfs_bmap_btalloc_filestreams(
 		goto out_low_space;
 	}
 
-	args->minlen = xfs_bmap_select_minlen(ap, args, blen);
+	error = xfs_bmap_select_minlen(ap, args, blen);
+	if (error)
+		goto out_low_space;
+
 	if (ap->aeof && ap->offset)
 		error = xfs_bmap_btalloc_at_eof(ap, args);
 
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
