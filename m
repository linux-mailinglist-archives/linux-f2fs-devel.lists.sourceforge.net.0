Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C096ED88
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 10:17:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smU9Z-0001Z7-Ch;
	Fri, 06 Sep 2024 08:17:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1smU9W-0001Yz-Hm
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 08:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oMEAYdKfFXO07i1fH7UCBEpLMj5qF2YH3KGZFVaJ284=; b=RmYJk+HQSDYCScTgInPGml9Qo3
 +jnMOvqsvJDwvvb7DKGUL1fBp2NxFIsPEqaVZ7cgHNf/iwEQKoSJWJL6YL1vTsE3JUEHKJ8ShG9KJ
 bfscqzBDR/xUdBTFivVEMMOb2Pei4IaM8KcaIu/+XJqPtZF/LRyjXOd1GsN2s81M2Lt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oMEAYdKfFXO07i1fH7UCBEpLMj5qF2YH3KGZFVaJ284=; b=ihGsfuOmAqD698j0OwFMJy1pi1
 T/6NJ2mE5p8JM7TxBY/4tkr0S+DBsFEnEMajC9aOdKxS2Z9PzCpwtfE61ONG9iveRDJQwHqdRfkIS
 4bAD3yl3mfbvcDd0SbkqTwiVhHGj4DXnx0m+soRGpZV4Odf52CNkdu12/fhnA70EArEM=;
Received: from mail-psaapc01on2041.outbound.protection.outlook.com
 ([40.107.255.41] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smU9V-0007tY-22 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 08:17:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmXKX0LQfm5rU9jZUij8qJLAExxub8Rm9Q9ZreeQZvcxoQ2V6p0gJYGaCtjLcDFWP+PBB+53YelqFclSX8n4zwU+oqGZU9jVZreXvBQYEWpCXm2ACGFueQy+mB/o4CZAPWsdVd3kjQHxvmeqSjmjw4gwsH7sGcJfVQjLb22LrwRaSLhI2QoRFLFyK8v3Fuggq8+p5PEs+tD4muR27FQY8NIQj866O4g53DaVOGc/AZ9FvyejH5qbb+z0lO2cyqSplim/g92qt13BIFpSR6dG9Ll4xDXXf7Qoqy8lJH4F2czs2gt8B0nh48wo0C7n8BRonrhxxlc3obfnThiYyktVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMEAYdKfFXO07i1fH7UCBEpLMj5qF2YH3KGZFVaJ284=;
 b=hlSNsBSVSHxu4TJ1kAOiXTeFED+KkqnzwS/NgFd3XQHDJ4MJxiq6yuThzkp5CoPNe0UQncfgxGyST3hX54pdI+7uY9hafytSWbRyikh8zuHplS+SSJJqIf1f2s+4HhdM2QsDO+57A3SkrSH9KsbeIkn8B7kMN+Z3zSycYKDRg4r8n7uobZQP9dYrCNYBERgJA4vGVbZXkppRu1yUTsAUYlHtep8LYQoxly6JKrynJBW4BRJ26pCOdXx8nlZFLKUir39NaqbvMtFhppvgL5ijTohISKDL2senVDr41f5nXe/vbBwyDoXCHi4Y5J5KBukSPvHUOMbzDwCs0AMRkZvTUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMEAYdKfFXO07i1fH7UCBEpLMj5qF2YH3KGZFVaJ284=;
 b=aINaTCEVV/YLd/uJdCB5ikTa2MJIBUiPV6Y5CZYtZH4u1oS4L419Mbzsx0GFEbiW7M5ZTE7DCt8swcC5tQsSVFHlyCfdcNqKp7uzXBOB0UY/TO0j9LWC/RYKiJ+HaewY6jLLQ8lC8otGgY/gn2kEXT/Yr4fFXvbjj7i4MNGP12tmxSp6BFa7L3UiO4fjU45svd0maNJKpIzfo6xF9aCqDA5ydAyoRxBUp50Sqr+2kdSASkB8p07CFH0I491K8v4e/cBNSgUDDtVmrQcsx8JodcHP+PWSi/tjrA+hgob4Y9u3Gm1PSIKjfttMj6QjlThhx67tURO1dv+c60X6ZfQo4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4494.apcprd06.prod.outlook.com (2603:1096:400:88::10)
 by PUZPR06MB6066.apcprd06.prod.outlook.com (2603:1096:301:113::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 08:16:58 +0000
Received: from TYZPR06MB4494.apcprd06.prod.outlook.com
 ([fe80::a5cd:b456:d951:32c4]) by TYZPR06MB4494.apcprd06.prod.outlook.com
 ([fe80::a5cd:b456:d951:32c4%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 08:16:57 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  6 Sep 2024 02:31:17 -0600
Message-Id: <20240906083117.3648386-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f51946e2-68f4-4368-9a77-050382dfa3ff@kernel.org>
References: 
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To TYZPR06MB4494.apcprd06.prod.outlook.com
 (2603:1096:400:88::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4494:EE_|PUZPR06MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: e44b46f1-2399-4c72-df31-08dcce4c4654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmJKTWxNSDU0cis2RGR0bHpTRndueHZ4d3NRNXU2bDYyV3FQZ0tkVE93ZGR4?=
 =?utf-8?B?Zm1aWFdGa3QrSE1ONzdYM3l1UXQ1cTg3aVJ5d0lpYlgwVGF2Mkt2MlU1OHJC?=
 =?utf-8?B?cTJob1B3b2QwaTk5OTFEK29XWFhUZklaQUdyYUlCdkRPRUNndXJtTS9teFN2?=
 =?utf-8?B?N0c2azhPVjNQUE5BVnd0MkhpM0NuK1B4WlJXVHdHcXQrTUNHU214dVpSNTE3?=
 =?utf-8?B?UmhUQTRpSjNsbFdKRHczYTBnRlQrcFRPekRWdDdETFZWWWRYaDRJNlJRZnhk?=
 =?utf-8?B?WW5sRTV4MXlwemF0NE85SmpaRU0xZGNjQnJYT1hjSmt5Z3RxaDcxYUpBZFhM?=
 =?utf-8?B?bUxQbUVKbTU5WjVPcy9kUWw5V2ViWkYvOHVKRVVLMzk0dzErZVlmTHBkUmdt?=
 =?utf-8?B?aWJnajhGd0xpcXNkV0JEdE56a3pGTmxtVmNhVTlFQkpEVzV3ejFMRzBxekNM?=
 =?utf-8?B?bHZINmVES3Rad3hkanNTYjRLMWFGNEtlcms0WmNGMnFYUVN0S1l0TTRCU2FK?=
 =?utf-8?B?TVd0NXc1RU5nczdMdlhZSEY2SHhpUU1FTHBJMGdBUjNtbnR0ZGYwSXh4K3dx?=
 =?utf-8?B?aFpnVjRRUzhCeVFHZ0dNM1BqSmtSbCtyTS9VaGFhYjhPSUd5NmMxQkhLOXJz?=
 =?utf-8?B?YXpGS1VOZEhIUFViekdBQ3VrS1BOdmwzYm81RGI0YlAvSWZqdDhxUTVPWlNQ?=
 =?utf-8?B?U1dScnU3Nm9iQVVaSy9LaFVlaFdkRUR4N0duWTRaNUFBR1MzU29xUDhUaGwz?=
 =?utf-8?B?bHl5RFE2UERqd2Q0QVd5eFdOa05xQTc0UUxzd3hyUUNSTTEzN2JrTGNmTkwy?=
 =?utf-8?B?eEFhc25zZG9aWldwQ1RYOS85bTE2T3BKWTlSRmJqNCtVclpZL1A1K1puamFk?=
 =?utf-8?B?Z1NYZVhhMWd0dG5ydmFaUU8vU1BFelV3N08wZVBtQ001SzJpeUZXR2tjTEli?=
 =?utf-8?B?NG92UVhEajN3YTkrMU9aNnExVE9ubU1yZUdkREVOeHVzU1RsZTRGUHFjRVor?=
 =?utf-8?B?dFBWeVhLZTVRemFtV0pwcGUwTVE0bmF3Zy9OMGgzUTdQaXpIYjZPNlRBaGtq?=
 =?utf-8?B?NWpZWjZaK2JnclZoa2NYQi82WE1FZ085YjlOMGZGS0NHSEdIOVpkQWE2WW9Q?=
 =?utf-8?B?empBeGpMK1BPMC9hZm1QNUh1UzlDbnZydStmQy85SGJXRm1lV1JLK0xoUlFa?=
 =?utf-8?B?ZmtKRkpZTlZSTjZ4b2lUVWpJVTFGRmpzYmVHVXNLQ1Y1bHJRdnpNWjl1U1BB?=
 =?utf-8?B?bU5aNGhMZW1kNUhtSm1zb2o1aXdnZEM5aDk2YTZUdXIrbkUzemlKUjBFWTAy?=
 =?utf-8?B?U0pQcWNzeldYeUFLVlI0dHN3NExIYzRnblRuUDR5R2xDUmtubmFjUy9GUE1J?=
 =?utf-8?B?YXNjcmVzU0F1c1pCc01QTjhaLzNFVVhYcysvR0c3VVc3K1NXamZPaVRJNzRo?=
 =?utf-8?B?UzVFR3JCMXVlejQwMkZGS293bjZacnA4OW9ubGpXeWdETlArOG5BaWE2b1Ru?=
 =?utf-8?B?V2wzZGdjeERHcjNNNWhJM3dENXVNaVdIU3VXbi9SdlQwOG1wQjdpODJPZjND?=
 =?utf-8?B?aXdPME9ISW9uNFdjazh6NWhFM2ZaWkJ0dnFxYXBqa2x4NDBWcklPdSsyMUc3?=
 =?utf-8?B?TmdJY3NHVW5sQ1NneEhKNWdsN2xqc0x2V3BCNGxJeVpWSWdKcEZJUEpaN2Ex?=
 =?utf-8?B?YVh4Qm44TnY2TnNRQXBmdUpUWUtZb3F4Y2Uwa1ErWFFMclo4WHUzSUZ4a2Y2?=
 =?utf-8?B?RVFLVjRCR0lrVE9ndjRYOTZzSjcrSlNmWTNrMTY0TXo0cEVlQVQyK3hIbXN1?=
 =?utf-8?B?enB5WThqOFJjeXJsNEFVNzJYUitGTWQvNDJocHVHOUFWNlppc2pvQlJDMXhC?=
 =?utf-8?B?ZEZUaTViUHRUa3EzT3IvT0Y1Q3VqUUJVKytwd3JQMFp1RWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4494.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWt3UzZTRnprcjcvT1VlLzVGclpLM3dUZ2VHZ0hDVGh4NFM5dld6bXlyMW1I?=
 =?utf-8?B?VmlhWDVQYnJZSm5ocWpMWmFxbmFncDZPTk1nM2NmV2pWZnhSWFFHMnRvVG5r?=
 =?utf-8?B?cTNrUjdBMHM0MkNvOXJBNHRlbUFrRzBQaGZVaXhUeWpqZGttV1YrTVZPMHhk?=
 =?utf-8?B?SWxpdTNOQjZIREY3eWhhKzZ6enVJWFF4WmdzaldubkRTQzRSQXVYYkhUZHRK?=
 =?utf-8?B?Qmx2TzJxK0VzVm53aU9VajAwbUNpUFd1ajJPWWtZR2IzZ0hLV0Z5TDdMK0Ez?=
 =?utf-8?B?UUFSLzZ1RWd1QW8rUmZPejAxTC9UV3VjQ0I1SlRsWGwrdjhMQ2JVbVN2T1RR?=
 =?utf-8?B?UkNRNm5DMWtUVHUvL1FySm82UFFaeHlUMmk5Z2RHVVpjVGl5TVEyb0NWanpS?=
 =?utf-8?B?bDc3TmZmRDNqb05tSG9iUnBkYUt0M2lSWEkzMThGelc2djJOVUx5MWdYWTFu?=
 =?utf-8?B?Tk1jZmExZmhDd3F6VkxwRnpsWDh5MlBmM081czZBc05UWkhsbEJjUlorYklk?=
 =?utf-8?B?Z29hMDdyeW1oMUVGUGZhai80OEhyRXhkeVRzUE02NUlRbWlUdTBzMDUvaUZw?=
 =?utf-8?B?RWs1cWpaZFZoMXdEMERZRmJzWS84T09LNGwrQlpVRWV3Tm1pTHNNN3Zmc2Rl?=
 =?utf-8?B?S29BSzFnOFExVEJTRWU0WDlWMlg4TStlMG5zWDFLUDlvNmozUEZUUWxVa2RE?=
 =?utf-8?B?RkJPcll2cUpiYnFUVUFGcXBCbHc4VU1DY2d3TFFlMFFaZ3czblFZTGVZYTZV?=
 =?utf-8?B?ekhQNHR6YzBQaHMzMEJoTWtnaDlZY1ZxNmo5UWJRWXp6dml6OXB0amxINFla?=
 =?utf-8?B?c3NoeVcvZ0RSVGhSLzVjdHNNd2ZXMkdSa3oyTFBMaVhqVUtUa1oyM1JpU0RN?=
 =?utf-8?B?TnJBRHF5dkorVyt4azZlcU1scGE5TjdRK0l4Y3dabmMvZDNneU5pR05LSWU4?=
 =?utf-8?B?LzQ4VFdiOS9DZEU3dWxBQkF4Ukp4QlFLRVpCMVNiVldGMUNua2U5V0hjQkN4?=
 =?utf-8?B?eW1FZGkzaU1VbTNQaEYrQkVEbVBCdkhaWFA5cmpSRUdYbUkrRTQrYkZPclBZ?=
 =?utf-8?B?cTJITGdjbTNNeFhGNUlzejFDdS9DTERJMllKYm05YTMwS0pqYUVYMHhSY0Qx?=
 =?utf-8?B?bmtjQ1FpRE9WUmdlaUpLeHA0T05RYlRYeEd3MUpHR1ZGQ01lT3JTSmwxWUhh?=
 =?utf-8?B?ODRVKzlqRmo1QzNpbG9SQVRMdFduMk1JUnlBeVFYNkhvNGNaYlV6VG16YjdV?=
 =?utf-8?B?Ykw5Q3ZpVnZ3azlJRjdYMmpLUWtJN0lJcTNKNkd1WWFVcWIzZGxXUStxK1FM?=
 =?utf-8?B?YUgrK01xMDlPamVkWlpUT0lONGMvNE5BRnBUMlZhYjYxcy9hRWE1ci8rNXY1?=
 =?utf-8?B?aksyd2wvKzBHdmQrV2ZrdkozWlNwVnZhYTA2Kzd4TDR0aG96ZVZSZXVML0Mv?=
 =?utf-8?B?QXN5OE1xMHBYb1U4bG9jaTE0ejRwTHZaeEtxb3FLUEptYUNENExKL05DUFNo?=
 =?utf-8?B?aFEvc09WdlNkQW4wUE1pQnhOQ3k2a3JVWHdDUjhIZElnT2V4RmptZzJCTGta?=
 =?utf-8?B?bnozN2dqN1BRMWJsR21HZHFCY1VmU2tVbXhTeWwwU3hJWHJtQXZsYVZRMWor?=
 =?utf-8?B?TElGQW5XLzVzR01IVWFJUFc1ekVzYzJxcXJTdjdPR3cvZUtBZTcyci9KWVFn?=
 =?utf-8?B?YmlHMU5aa2h6U3BlQ08yZUpjVTNDbjJsOUQxMDRsaXZxVzlGR1VIS2E2L2R1?=
 =?utf-8?B?cHdHM01MYWU3aHFWbnhPanllVUJVYXdtOVJ6NVNtZzkrT1RQcUVUOWZWcXRV?=
 =?utf-8?B?UVVEVENOUHAyM3dYSzQ5VjFQL0RKSVF3cE5SOUR3dWU2elNhczRDQ3MxaWx6?=
 =?utf-8?B?TmZucnUwYUpHSHNDNDRYMEw0bURZZ2pKdWU2SEtORVVPcHdEdXJNL1JHMlhP?=
 =?utf-8?B?QmRFTWVBOXBsY2dXUnVmQ1lVWXdQUW1lZnd4YkRWeVhNb3VwQ1BBNHdrbGtK?=
 =?utf-8?B?N2NZby92OWZoZGVmQWgzU2Y4ZWpqYWxlNUhBaU41cUlYdFR5QUIxY2FQZGFR?=
 =?utf-8?B?YjVYZ3ptblhLMTZuY1h0YUxPVWd1QjIwQmkxVGYrN2hZTjZFU2d4KzZFSG82?=
 =?utf-8?Q?c9fIunHONg3AuWG4zQWBt5Kml?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44b46f1-2399-4c72-df31-08dcce4c4654
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4494.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:16:57.5688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLwaYK9HHXart4D+OorROfAywr16raflAWvfRH8aApNmn/bt343uiR2McU1te0+UNiDs9PuDVreYVPOrn2AtPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6066
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 20, 2024 at 02:50:11PM +0800, Chao Yu wrote: >
 On 2024/2/8 16:11, Wu Bo wrote: > > On 2024/2/5 11:54, Chao Yu wrote: > >
 > How about calling f2fs_balance_fs() to double check and make sure [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1smU9V-0007tY-22
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: stop allocating pinned
 sections if EAGAIN happens"
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Wu Bo <bo.wu@vivo.com>,
 Wu Bo <wubo.oduw@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMDI6NTA6MTFQTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToK
PiBPbiAyMDI0LzIvOCAxNjoxMSwgV3UgQm8gd3JvdGU6Cj4gPiBPbiAyMDI0LzIvNSAxMTo1NCwg
Q2hhbyBZdSB3cm90ZToKPiA+ID4gSG93IGFib3V0IGNhbGxpbmcgZjJmc19iYWxhbmNlX2ZzKCkg
dG8gZG91YmxlIGNoZWNrIGFuZCBtYWtlIHN1cmUgdGhlcmUgaXMKPiA+ID4gZW5vdWdoIGZyZWUg
c3BhY2UgZm9yIGZvbGxvd2luZyBhbGxvY2F0aW9uLgo+ID4gPiAKPiA+ID4gwqDCoMKgwqDCoMKg
wqAgaWYgKGhhc19ub3RfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgR0VUX1NFQ19GUk9NX1NFRyhzYmksIG92ZXJwcm92aXNpb25fc2VnbWVudHMo
c2JpKSkpKSB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19kb3duX3dyaXRlKCZz
YmktPmdjX2xvY2spOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRfaW5jX2djX2Nh
bGxfY291bnQoc2JpLCBGT1JFR1JPVU5EKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
cnIgPSBmMmZzX2djKHNiaSwgJmdjX2NvbnRyb2wpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChlcnIgPT0gLUVBR0FJTikKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGYyZnNfYmFsYW5jZV9mcyhzYmksIHRydWUpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChlcnIgJiYgZXJyICE9IC1FTk9EQVRBKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBvdXRfZXJyOwo+ID4gPiDCoMKgwqDCoMKgwqDCoCB9Cj4gPiA+IAo+
ID4gPiBUaGFua3MsCj4gPiAKPiA+IGYyZnNfYmFsYW5jZV9mcygpIGhlcmUgd2lsbCBub3QgY2hh
bmdlIHByb2NlZHVyZSBicmFuY2ggYW5kIG1heSBqdXN0IHRyaWdnZXIgYW5vdGhlciBHQy4KPiA+
IAo+ID4gSSdtIGFmcmFpZCB0aGlzIGlzIGEgYml0IHJlZHVuZGFudC4KPiAKPiBPa2F5Lgo+IAo+
IEkgZ3Vlc3MgbWF5YmUgSmFlZ2V1ayBoYXMgY29uY2VybiB3aGljaCBpcyB0aGUgcmVhc29uIHRv
IGNvbW1pdAo+IDJlNDJiN2Y4MTdhYyAoImYyZnM6IHN0b3AgYWxsb2NhdGluZyBwaW5uZWQgc2Vj
dGlvbnMgaWYgRUFHQUlOIGhhcHBlbnMiKS4KCkhpIEphZWdldWssCgpXZSBvY2Nhc2lvbmFsbHkg
cmVjZWl2ZSB1c2VyIGNvbXBsYWludHMgYWJvdXQgT1RBIGZhaWx1cmVzIGNhdXNlZCBieSB0aGlz
IGlzc3VlLgpQbGVhc2UgY29uc2lkZXIgbWVyZ2luZyB0aGlzIHBhdGNoLgoKVGhhbmtzCgo+IAo+
IFRoYW5rcywKPiAKPiA+IAo+ID4gPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
